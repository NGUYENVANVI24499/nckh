@extends('master')
@section('admin_content') 
 
  <div class="row">
            <div class="col-lg-12">
            	
                    <section class="panel">
                        <header class="panel-heading">
                        	LỊCH LÀM VIỆC
					CỦA VIỆN KỸ THUẬT – CÔNG NGHỆ
			Tuần thứ 43 (Từ ngày 19/10/2020 đến ngày 25/10/2020)

                        </header>
                       
							<table class="table table-bordered">
								 <thead>	
							  <tr>
							  	<!-- <th> {{Carbon\Carbon::now()}}</th> -->
							  	<th width="122" scope="col">ngày công tác</th>
							    <th width="133" scope="col">Thời gian</th>
							    <th width="120" scope="col">Nội dung</th>
							    <th width="90" scope="col">Thành phần</th>
							    <th width="120" scope="col">Địa điểm</th>

							  </tr>
							</thead>
							<td> thứ  ,ngày </td>
							  @foreach($a as $lich)
							  	


							  @if ($loop->first)
							        <td>This is the first iteration.</td>
							    @endif

							    @if ($loop->last)
							        This is the last iteration.
							    @endif

							  <td>  <p> {{ $lich->id_lichcongtac }}</p>




							
							<!--  <tr>
							  @if($lich->ngay)
							  	<td >{{Carbon\Carbon::parse($lich->ngay)->format('d - m - Y')}} </td>
							 

							  @endif
								<td >{{Carbon\Carbon::parse($lich->ngay)->format('d - m - Y')}} </td>
							    <td > {{ $lich->thoigian}}</td>
							    
							   <td>{{$lich->noidung}}</td>
							   <td> 
							   	<a href="{{URL::to('thanhphan',$lich->id_lichcongtac)}}"> danh sách GV</a>
							   	</td>
							  
							   <td>{{$lich->diadiem}}</td>
							  </tr> -->
							 @endforeach
							</table>

						</section>
								
					</div>
					</div>


@endsection
