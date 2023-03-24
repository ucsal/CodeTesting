import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListarSubmissoesAlunosComponent } from './listar-submissoes-alunos.component';

describe('ListarSubmissoesAlunosComponent', () => {
  let component: ListarSubmissoesAlunosComponent;
  let fixture: ComponentFixture<ListarSubmissoesAlunosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListarSubmissoesAlunosComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListarSubmissoesAlunosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
