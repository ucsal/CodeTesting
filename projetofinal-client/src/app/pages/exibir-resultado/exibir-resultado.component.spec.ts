import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExibirResultadoComponent } from './exibir-resultado.component';

describe('ExibirResultadoComponent', () => {
  let component: ExibirResultadoComponent;
  let fixture: ComponentFixture<ExibirResultadoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExibirResultadoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ExibirResultadoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
