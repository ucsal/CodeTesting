import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastrarRespostaComponent } from './cadastrar-resposta.component';

describe('CadastrarRespostaComponent', () => {
  let component: CadastrarRespostaComponent;
  let fixture: ComponentFixture<CadastrarRespostaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CadastrarRespostaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CadastrarRespostaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
