import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListarResultadosComponent } from './listar-resultados.component';

describe('ListarResultadosComponent', () => {
  let component: ListarResultadosComponent;
  let fixture: ComponentFixture<ListarResultadosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListarResultadosComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListarResultadosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
