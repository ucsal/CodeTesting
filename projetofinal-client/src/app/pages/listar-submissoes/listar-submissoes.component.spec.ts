import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListarSubmissoesComponent } from './listar-submissoes.component';

describe('ListarSubmissoesComponent', () => {
  let component: ListarSubmissoesComponent;
  let fixture: ComponentFixture<ListarSubmissoesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListarSubmissoesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListarSubmissoesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
