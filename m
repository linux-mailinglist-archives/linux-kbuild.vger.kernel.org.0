Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E0B2564D3
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 07:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgH2FQv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 01:16:51 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:35325 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgH2FQq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 01:16:46 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 07T5FRB8012582;
        Sat, 29 Aug 2020 14:15:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 07T5FRB8012582
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598678129;
        bh=pTE3lmBGOvNowbrsAqN2/QBMVw6Grccak2qbFkGyA24=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mJDfCDlPox01f1bR0WpCvIst3BadiOOImr0xkFpOKy0/sPefP8vp3F/CNIG8k9r6M
         c1D/IAUpGpkZLwX597TrDap1Kxp2kDd7j5nmTXaCZxtlQpLao7tATzlAfokopPTvRQ
         PJPdPMQvr5prA/Ua3wWm9qc9PvFn/q3R4+vNPwgBbSapDn94PRCvSQjIIt8CC2KwOi
         dn8MT89I3yfleeGGFzNcB2aCF8/872eQrlt8tQtr4E9gTUfliPFczbpEz6YqTuhWpR
         2vokwTn4y0Q6bYNSYYnauejcYrvYzunulVesW3FhurUi/hsDADVnawZP4OcYhQ41MO
         MY/GNhp7KPLyw==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        linux-ia64@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ia64: do not typedef struct pal_min_state_area_s
Date:   Sat, 29 Aug 2020 14:15:22 +0900
Message-Id: <20200829051524.706585-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200829051524.706585-1-masahiroy@kernel.org>
References: <20200829051524.706585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Documentation/process/coding-style.rst says:

  Please don't use things like ``vps_t``.
  It's a **mistake** to use typedef for structures and pointers.

This commit converts as follows:

  struct pal_min_state_area_s  ->  struct pal_min_state_area
         pal_min_state_area_t  ->  struct pal_min_state_area

My main motivation for this is to slim down the include directives
of <asm/mca.h> in the next commit.

Currently, <asm/mca.h> is required to include <asm/pal.h> directly
or indirectly due to (pal_min_state_area_t *). Otherwise, it would
have no idea what pal_min_state_area_t is.

Replacing it with (struct pal_min_state_area *) will relax the header
dependency since it is enough to tell it is a pointer to a structure,
and to resolve the size of struct pal_min_state_area. It will make
<asm/mca.h> independent of <asm/pal.h>.

<asm/pal.h> typedef's a lot of structures, but it is trivial to
convert the others in the same way.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/ia64/include/asm/mca.h    |  2 +-
 arch/ia64/include/asm/pal.h    |  4 ++--
 arch/ia64/include/asm/sal.h    |  2 +-
 arch/ia64/kernel/asm-offsets.c | 18 +++++++++---------
 arch/ia64/kernel/mca.c         |  4 ++--
 arch/ia64/kernel/mca_drv.c     |  2 +-
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/ia64/include/asm/mca.h b/arch/ia64/include/asm/mca.h
index 726df17f1b51..c92b9c15962c 100644
--- a/arch/ia64/include/asm/mca.h
+++ b/arch/ia64/include/asm/mca.h
@@ -83,7 +83,7 @@ struct ia64_sal_os_state {
 	/* common */
 	unsigned long		sal_ra;			/* Return address in SAL, physical */
 	unsigned long		sal_gp;			/* GP of the SAL - physical */
-	pal_min_state_area_t	*pal_min_state;		/* from R17.  physical in asm, virtual in C */
+	struct pal_min_state_area *pal_min_state;	/* from R17.  physical in asm, virtual in C */
 	/* Previous values of IA64_KR(CURRENT) and IA64_KR(CURRENT_STACK).
 	 * Note: if the MCA/INIT recovery code wants to resume to a new context
 	 * then it must change these values to reflect the new kernel stack.
diff --git a/arch/ia64/include/asm/pal.h b/arch/ia64/include/asm/pal.h
index f9d2b3b2dfad..b1d87955e8cc 100644
--- a/arch/ia64/include/asm/pal.h
+++ b/arch/ia64/include/asm/pal.h
@@ -750,7 +750,7 @@ typedef union pal_mc_error_info_u {
  * for PAL.
  */
 
-typedef struct pal_min_state_area_s {
+struct pal_min_state_area {
 	u64	pmsa_nat_bits;		/* nat bits for saved GRs  */
 	u64	pmsa_gr[15];		/* GR1	- GR15		   */
 	u64	pmsa_bank0_gr[16];	/* GR16 - GR31		   */
@@ -766,7 +766,7 @@ typedef struct pal_min_state_area_s {
 	u64	pmsa_xfs;		/* previous ifs		   */
 	u64	pmsa_br1;		/* branch register 1	   */
 	u64	pmsa_reserved[70];	/* pal_min_state_area should total to 1KB */
-} pal_min_state_area_t;
+};
 
 
 struct ia64_pal_retval {
diff --git a/arch/ia64/include/asm/sal.h b/arch/ia64/include/asm/sal.h
index 08f5b6aaed73..78f4f7b40435 100644
--- a/arch/ia64/include/asm/sal.h
+++ b/arch/ia64/include/asm/sal.h
@@ -385,7 +385,7 @@ typedef struct sal_processor_static_info {
 		    fr              : 1,
 		    reserved        : 58;
 	} valid;
-	pal_min_state_area_t min_state_area;
+	struct pal_min_state_area min_state_area;
 	u64 br[8];
 	u64 cr[128];
 	u64 ar[128];
diff --git a/arch/ia64/kernel/asm-offsets.c b/arch/ia64/kernel/asm-offsets.c
index fb0deb8a4221..be3b90fef2e9 100644
--- a/arch/ia64/kernel/asm-offsets.c
+++ b/arch/ia64/kernel/asm-offsets.c
@@ -245,23 +245,23 @@ void foo(void)
 	BLANK();
 
 	DEFINE(IA64_PMSA_GR_OFFSET,
-	       offsetof (struct pal_min_state_area_s, pmsa_gr));
+	       offsetof(struct pal_min_state_area, pmsa_gr));
 	DEFINE(IA64_PMSA_BANK1_GR_OFFSET,
-	       offsetof (struct pal_min_state_area_s, pmsa_bank1_gr));
+	       offsetof(struct pal_min_state_area, pmsa_bank1_gr));
 	DEFINE(IA64_PMSA_PR_OFFSET,
-	       offsetof (struct pal_min_state_area_s, pmsa_pr));
+	       offsetof(struct pal_min_state_area, pmsa_pr));
 	DEFINE(IA64_PMSA_BR0_OFFSET,
-	       offsetof (struct pal_min_state_area_s, pmsa_br0));
+	       offsetof(struct pal_min_state_area, pmsa_br0));
 	DEFINE(IA64_PMSA_RSC_OFFSET,
-	       offsetof (struct pal_min_state_area_s, pmsa_rsc));
+	       offsetof(struct pal_min_state_area, pmsa_rsc));
 	DEFINE(IA64_PMSA_IIP_OFFSET,
-	       offsetof (struct pal_min_state_area_s, pmsa_iip));
+	       offsetof(struct pal_min_state_area, pmsa_iip));
 	DEFINE(IA64_PMSA_IPSR_OFFSET,
-	       offsetof (struct pal_min_state_area_s, pmsa_ipsr));
+	       offsetof(struct pal_min_state_area, pmsa_ipsr));
 	DEFINE(IA64_PMSA_IFS_OFFSET,
-	       offsetof (struct pal_min_state_area_s, pmsa_ifs));
+	       offsetof(struct pal_min_state_area, pmsa_ifs));
 	DEFINE(IA64_PMSA_XIP_OFFSET,
-	       offsetof (struct pal_min_state_area_s, pmsa_xip));
+	       offsetof(struct pal_min_state_area, pmsa_xip));
 	BLANK();
 
 	/* used by fsys_gettimeofday in arch/ia64/kernel/fsys.S */
diff --git a/arch/ia64/kernel/mca.c b/arch/ia64/kernel/mca.c
index 2703f7795672..17151269d655 100644
--- a/arch/ia64/kernel/mca.c
+++ b/arch/ia64/kernel/mca.c
@@ -894,7 +894,7 @@ static void
 finish_pt_regs(struct pt_regs *regs, struct ia64_sal_os_state *sos,
 		unsigned long *nat)
 {
-	const pal_min_state_area_t *ms = sos->pal_min_state;
+	const struct pal_min_state_area *ms = sos->pal_min_state;
 	const u64 *bank;
 
 	/* If ipsr.ic then use pmsa_{iip,ipsr,ifs}, else use
@@ -970,7 +970,7 @@ ia64_mca_modify_original_stack(struct pt_regs *regs,
 	char *p;
 	ia64_va va;
 	extern char ia64_leave_kernel[];	/* Need asm address, not function descriptor */
-	const pal_min_state_area_t *ms = sos->pal_min_state;
+	const struct pal_min_state_area *ms = sos->pal_min_state;
 	struct task_struct *previous_current;
 	struct pt_regs *old_regs;
 	struct switch_stack *old_sw;
diff --git a/arch/ia64/kernel/mca_drv.c b/arch/ia64/kernel/mca_drv.c
index 4d0ab323dee8..36a69b4e6169 100644
--- a/arch/ia64/kernel/mca_drv.c
+++ b/arch/ia64/kernel/mca_drv.c
@@ -496,7 +496,7 @@ recover_from_read_error(slidx_table_t *slidx,
 			struct ia64_sal_os_state *sos)
 {
 	u64 target_identifier;
-	pal_min_state_area_t *pmsa;
+	struct pal_min_state_area *pmsa;
 	struct ia64_psr *psr1, *psr2;
 	ia64_fptr_t *mca_hdlr_bh = (ia64_fptr_t*)mca_handler_bhhook;
 
-- 
2.25.1

