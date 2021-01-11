<?php


namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;
use Session;
use Illuminate\Support\Facades\redirect;

use App\Models\lecturers;
use App\Models\week;
use App\Models\workschedule;
use App\Models\workschedule_type;
use App\Models\attendance;
use App\Models\element;


use Auth;
session_start();



class AdminController extends Controller
{
    public function getindex(){
    	return view('Page.index');
    }
    public function getlichcongtac(){
    	 $a =DB::table('workschedule')->orderBy('date_begin','asc')->get();
        
         
        // $b=DB::table()
    	return view('Page.lichcongtac', compact('a'));
    }
    public function gettuancongtac(){

        $tuan = week::all();
        $end = week::orderBy('id_week','desc')->first();
    	return view('Page.tuancongtac',compact('tuan','end'));
    }
    public function getthanhphan($id ){
            $thanhphan=DB::table('element')->where('id_element',$id)->join('lecturers','element.id_lecturers','=','lecturers.id_lecturers')->get();

        return view('Page.danhsachGV',compact('thanhphan'));
    }
    public function themcongtactuan($id){
        $idd = $id;
        $loaicongtac = workschedule_type::all();
        return view('Page.themcongtactuan',compact('idd','loaicongtac'));
    }
 






//thêm lịch công tác.
    public function addlichcongtac( Request $req){
        
        $datalich = new workschedule();

        $datalich->id_week = $req->idtuan;
        $datalich->id_worktype = $req->loaicongtac;
        $datalich->date_begin = $req->date;
        $datalich->time = $req->thoigian;
        $datalich->date_finish = $req->date_end;
        $datalich->content = $req->noidung;
        $datalich->place = $req->diadiem;
        $datalich->save();
        Session::put('message',' thêm lịch công tác thành công');
        return Redirect::to('themgiangvien');
       
    }

//thêm giảng viên
public function addgiangvien(){
    $congtac = workschedule::orderBy('id_workschedule','DESC')->join('workschedule_type','workschedule.id_worktype','workschedule_type.id_worktype')->first();
    return view('Page.addgiangvien' , compact('congtac'));
}
public function addgv(){
    $Gv = lecturers::all();
    $stt = 1;
    return view('Page.adddanhsachgv',compact('Gv','stt'));
}
//thêm tuần công tác
public function themtuan($id){
    
    $a  =(int)$id;
    $a = $a +1;
    $add='LỊCH CÔNG TÁC TUẦN '.$a;
    $tuan = new week;
    $tuan->name_week=$add;
    $tuan->save();
    return redirect()->back()->with('thongbao','thêm tuần thành công');

}


   
    public function gettest(){
        
        $gvien = workschedule::join('element','workschedule.id_workschedule','element.id_element')->join('lecturers','element.id_lecturers','lecturers.id_lecturers')->get();

        return view('Page.test' ,compact('gvien'));
    }




    //điểm danh

    public function viewdiemdanh(){
        $currentDate = date('Y-m-d');
        $congtactoday= workschedule::where('date_begin','<=',$currentDate)
                                    ->where('date_finish','>=',$currentDate)
                                    ->join('workschedule_type','workschedule.id_worktype','workschedule_type.id_worktype')
                                    ->get();
        $stt=1;

        return view('Page.diemdanh',compact('congtactoday','stt'));
    }
    public function getdanhsachdiemdanh($id){
        $index = 1;
        //check dữ lieu
        $lichcongtac= workschedule::where('id_workschedule',$id)->get();
        if($lichcongtac != null && count($lichcongtac)>0){
            $lichcongtac = $lichcongtac[0];
        }else{
            return redirect()->route('diemdanh');
        }

        //danh sách giảng viên
        $mydate =new \DateTime();
        $currentDate = $mydate->format('Y-m-d');

        $edit = attendance::where('id_workschedule',$id)
                        ->leftJoin('lecturers','attendance.id_lecturers','lecturers.id_lecturers')
                        ->where('created_at','>=',$currentDate)->get();
        $giangvienList = null;
        if($edit == null || count($edit)==0){
            $giangvienList = element::where('id_element',$id)
                            ->Join('lecturers','element.id_lecturers','lecturers.id_lecturers')
                            ->SELECT ('lecturers.name_gv' ,'lecturers.id_lecturers')
                            ->get();
        }

        return view('Page.danhsachdiemdanh',
            compact('giangvienList','index','edit','lichcongtac'));
    }
    
    public function postdiemdanh(Request $request){
        $mydate =new \DateTime();
        $currentTime = $mydate->format('Y-m-d H:i:s');
        $currentDate = $mydate->format('Y-m-d H:i:s');
        $id_workschedule = $request->id_congtac;
        $data = json_decode($request->data, true);

        //check du lieu da ton tai hay chua
        $edit = attendance::where('id_workschedule',$id_workschedule)
                        ->Join('lecturers','attendance.id_lecturers','lecturers.id_lecturers')
                        ->get();
        if($edit!=null && count($edit)>0){
            //update
            foreach ($data as $item) {
            DB::table('attendance')
                ->where('id_workschedule',$id_workschedule)
                ->where('id_lecturers',$item['id_gvien'])
                ->update([
                'status'=>$item['status'],
                'note'=>$item['node'],
                'update_at'=>$currentTime
                ]);
                }
                   return redirect()->route('diemdanh');  
            }
        
             //them moi
        foreach ($data as $item) {
            DB::table('attendance')->insert([
                'id_workschedule'=>$id_workschedule,
                'id_lecturers'=>$item['id_gvien'],
                'status'=>$item['status'],
                'note'=>$item['node'],
                'created_at'=>$currentTime,
                'update_at'=>$currentTime
            ]);
        }
        return redirect()->route('diemdanh'); 
    }
        
}
