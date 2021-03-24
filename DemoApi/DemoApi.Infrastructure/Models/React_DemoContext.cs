using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DemoApi.Infrastructure.Models
{
    public partial class React_DemoContext : DbContext
    {
        public React_DemoContext()
        {
        }

        public React_DemoContext(DbContextOptions<React_DemoContext> options)
            : base(options)
        {
        }

        public virtual DbSet<TblCard> TblCard { get; set; }
        public virtual DbSet<TblCardAnnualCharge> TblCardAnnualCharge { get; set; }
        public virtual DbSet<TblCardLimit> TblCardLimit { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TblCard>(entity =>
            {
                entity.ToTable("tbl_Card");

                entity.Property(e => e.CardType)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TblCardAnnualCharge>(entity =>
            {
                entity.ToTable("tbl_CardAnnualCharge");

                entity.Property(e => e.AnnualCharge).HasColumnType("decimal(10, 2)");

                entity.HasOne(d => d.CardTypeNavigation)
                    .WithMany(p => p.TblCardAnnualCharge)
                    .HasForeignKey(d => d.CardType)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tbl_CardAnnualCharge_tbl_Card");
            });

            modelBuilder.Entity<TblCardLimit>(entity =>
            {
                entity.ToTable("tbl_CardLimit");

                entity.Property(e => e.CreditLimit).HasColumnType("decimal(10, 2)");

                entity.HasOne(d => d.CardTypeNavigation)
                    .WithMany(p => p.TblCardLimit)
                    .HasForeignKey(d => d.CardType)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tbl_CardLimit_tbl_Card");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
