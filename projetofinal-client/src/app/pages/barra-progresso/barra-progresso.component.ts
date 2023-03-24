import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-barra-progresso',
  templateUrl: './barra-progresso.component.html',
  styleUrls: ['./barra-progresso.component.css']
})
export class BarraProgressoComponent implements OnInit {
  @Input() certo: number = 0;
  @Input() errado: number = 0;

  constructor() { }

  ngOnInit(): void {

  }

}
