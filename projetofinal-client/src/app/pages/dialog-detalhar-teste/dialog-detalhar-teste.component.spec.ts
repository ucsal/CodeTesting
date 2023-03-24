import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogDetalharTesteComponent } from './dialog-detalhar-teste.component';

describe('DialogDetalharTesteComponent', () => {
  let component: DialogDetalharTesteComponent;
  let fixture: ComponentFixture<DialogDetalharTesteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogDetalharTesteComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogDetalharTesteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
