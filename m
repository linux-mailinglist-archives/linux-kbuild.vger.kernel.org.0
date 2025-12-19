Return-Path: <linux-kbuild+bounces-10263-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBC3CD1BF2
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 21:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 727EF300A34A
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 20:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06CC3242B7;
	Fri, 19 Dec 2025 20:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="q6hmrOvU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NSTbH24q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6216633ADB1;
	Fri, 19 Dec 2025 20:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766175994; cv=none; b=ZNRKe3kAP/9wXkTMdABy5ao/QEjdrzjPvNvH06MagqjuEA6DPieKZO31cleZJLokCWVzRjfDUjA/x4G/z7GdDkYvQ32lpVjPA6sZyGhaWvKebvg7qYzv1zQmncqLu6wTg8SqutRbStG2tXQPYzukj1so98ygQpVvjLTv3VseBR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766175994; c=relaxed/simple;
	bh=LkUdmjEez7YHgGYcmbZwF857zNlnX5aUHTHVFW+PSd0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=njXgHfwU8Y+FkDl+nQZvqlYC3PHIfq6Jc/uXWNmnLgMom4GwC+XqLW6hrLyCdnQExK/+dFvjyMYTy31jyUjhAxu1MrgR00zTSpggeFU42r0i84iRoJ/pvWQq/nOVHk6oyBydc1mQmm1cfoS9gf5R1Jk7Ufqjyl5VI+xgHshUBt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=q6hmrOvU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NSTbH24q; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 8EA811D0007A;
	Fri, 19 Dec 2025 15:26:30 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 19 Dec 2025 15:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766175990;
	 x=1766262390; bh=klNOgsPY7VNBi9QQsPMNYdqGx8PLPBkIxGMrTR6UghI=; b=
	q6hmrOvUsGFNn9MunWMoPY5ewEAKjlfQaDQwuNqPOHpCiQCTFo0t3osRMOiFZcLV
	p8mOww7P3WSyyT/BO4T1zYZwxGSu0nos3ZKFI9papeWfOUtXHWR2MplZRYgnTK9c
	b7O8I1QWWgWcpr0UYDxtKp0Y1qOWIrFWVrHZ3z+hBGwlSy4GWy9bl3SpP54dYsLZ
	ruV96M+SOx7DySwdwWO4raTDXIJnluN6liEkX4N3CYAY4niemnajnoR7h3Dlgfso
	Uy3w17XPSO3aqUf2d1ycTXqbPY7OnIhwX783XV9bh6WGVME3Sf5DE2FpIiqL7VHT
	/MynHaIh0gvc6JDLSTuUJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766175990; x=
	1766262390; bh=klNOgsPY7VNBi9QQsPMNYdqGx8PLPBkIxGMrTR6UghI=; b=N
	STbH24q7mcwgjqTA6W69mnQOmf7OgIbeEAUxf00Wxtd/YK7+pb3WlliWb89oDGBc
	OtmmCVRoO2aLQ07LM2cA+jKQNk0ErAe1ga7mn5XfP4tb58QfUHu13u/NOM89CSJC
	T96alU2i9xldnO/GYIRK/ZD/WaDbAbCC5oKBxtbFc6rnnJM7BXIoAVm+v6UAxBTj
	7SvEUiakF9iGIiAOUwQGfhH4wy/MC+bcwS8A3hkSjkU7LPLmSP0DedTDCfJi+rsJ
	SKmCB0EEHRudAP7E7DZsz6KSIPyM7N/PCLNkgL7VItKrKNzd41ZMih/hJgnfk5dX
	C5Ap43ML4DVzxjk3UawnA==
X-ME-Sender: <xms:9rRFacj_ISnTj9lwX4x7fNWm6TP8oHeQR8nltDAnC_aDg0XWc3WeDA>
    <xme:9rRFaf1rNiearW1rX85xxnh5l1qjyUjgd-MXN-zefoiAa8dNAxTli2eXaywNwyEb6
    yJedc3CW752-swTYxx58Nh0I6Jkt2gXVcQyxNDF0yNc1lAdNtwGoERf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegledviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeeltdffheetheehveeujeehveffieefkedtheejleegffehgeetfedtgfefgfelhfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhmihgsrdhnvghtnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdgu
    vgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepug
    grvhhiugdrlhgrihhghhhtrdhlihhnuhigsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    nhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnshgtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:9rRFabtZXYO9Cy4jqo9Ycvrf4yZT-58RfP6VePXEwizSPmrr24-KQA>
    <xmx:9rRFaVaQvbNhuwkLOgLpnSYCPdx63tZGsl3lbOKuomku4ZDvst1eQQ>
    <xmx:9rRFaaUA5dD3Z0hZGI4Lol6Aphpz9baA17X2JGwDz-UI3DCMfsIl6w>
    <xmx:9rRFaaTFolWKoejTOyzB1KXWCBIOIm-N08t5Y-zv2YPZ7VCfR2oTlg>
    <xmx:9rRFaY77fygnywiuB4EUfvIWgHHUNFZliNrV5QdLOUY0HTsCU3H4pf6Z>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 40382C4006B; Fri, 19 Dec 2025 15:26:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AnL4ggAL8ANo
Date: Fri, 19 Dec 2025 21:26:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "David Laight" <david.laight.linux@gmail.com>
Cc: "Nicolas Schier" <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <b4bfacfa-b6a0-4c6b-8ada-29763cf64ad5@app.fastmail.com>
In-Reply-To: <20251219201231.GB1404453@ax162>
References: <20251214131528.3648-1-david.laight.linux@gmail.com>
 <20251219201231.GB1404453@ax162>
Subject: Re: [PATCH 1/1] kbuild: Only enable
 -Wtautological-constant-out-of-range-compare for W=2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Dec 19, 2025, at 21:12, Nathan Chancellor wrote:
> On Sun, Dec 14, 2025 at 01:15:28PM +0000, david.laight.linux@gmail.com wrote:
>> From: David Laight <david.laight.linux@gmail.com>
>> 
>> The kernel code style is to use !(expr) rather that (expr) == 0.
>> But clang complains that converting some constant expressions
>> (eg (0xffffu << 16)) to a boolean always evalutes to true.
>> This happens often in the validity checks in #defines.
>> Move tautological-constant-out-of-range-compare to W=2 (along with the
>> similar type-limits).
>> 
>> Signed-off-by: David Laight <david.laight.linux@gmail.com>
>
> I would like Arnd to comment on this before applying because the
> reasoning of this change does not feel good enough to disable this
> warning. It is not like '== 0' is inherently uncommon in the kernel or
> hard to write to avoid the implicit conversion warning. To be honest, I
> am a bit surprised -Wtautological-constant-out-of-range-compare fires
> for that instead of some sort of -Wconversion warning...

I actually have the warning enabled by default in my randconfig
tree. I have a couple of fixup patches for the warnings we get
in the tree, but this should totally be fixable upstream as well.

See below for my patches. Are there any ones I missed?

    Arnd


From cb753c6f52ac5b8514c95be6263b2942ea71efd8 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 26 Jun 2025 19:59:06 +0200
Subject: [PATCH] riscv: limit sifive errate to CONFIG_64BIT

There are two errata for this vendor, and they both individually depend on
CONFIG_64BIT already. However, an 32-bit allmodconfig produces this warning
from clang for a condition that can never be true.

arch/riscv/errata/sifive/errata.c:29:14: error: result of comparison of constant 9223372036854775815 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
   29 |         if (arch_id != 0x8000000000000007 ||
      |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~
arch/riscv/errata/sifive/errata.c:42:14: error: result of comparison of constant 9223372036854775815 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
   42 |         if (arch_id != 0x8000000000000007 && arch_id != 0x1)
      |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index aca9b0cfcfec..1480abe54288 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -46,7 +46,7 @@ config ERRATA_MIPS_P8700_PAUSE_OPCODE
 
 config ERRATA_SIFIVE
 	bool "SiFive errata"
-	depends on RISCV_ALTERNATIVE
+	depends on RISCV_ALTERNATIVE && 64BIT
 	help
 	  All SiFive errata Kconfig depend on this Kconfig. Disabling
 	  this Kconfig will disable all SiFive errata. Please say "Y"
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index d621b85dd63b..06ec2caaf73b 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -34,6 +34,7 @@ config ARCH_RENESAS
 config ARCH_SIFIVE
 	bool "SiFive SoCs"
 	select ERRATA_SIFIVE if !XIP_KERNEL
+	depends on 64BIT
 	help
 	  This enables support for SiFive SoC platform hardware.
 

From bcd1c82d604af688b6dc3b2a67454a47150b4d6d Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 20 Jun 2025 23:31:30 +0200
Subject: [PATCH] scsi: ibmvscsi_tgt: fix clang build warning

This is one of a handful of drivers that trigger the
-Wtautological-constant-out-of-range-compare warning flag:

drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c:1630:32: error: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Werror,-Wtautological-constant-out-of-range-compare]

Extend the type appropriately to avoid the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
index f259746bc804..9ef6fefbf0ad 100644
--- a/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
+++ b/drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
@@ -1616,7 +1616,8 @@ static int ibmvscsis_cap_mad(struct scsi_info *vscsi, struct iu_entry *iue)
 	struct capabilities *cap;
 	struct mad_capability_common *common;
 	dma_addr_t token;
-	u16 olen, len, status, min_len, cap_len;
+	u16 len, status, min_len, cap_len;
+	u32 olen;
 	u32 flag;
 	uint flag_bits = 0;
 	long rc = 0;

From 523a92edf0b8e32a9b1da160d3edaebeb12cfccc Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Jul 2024 16:25:07 +0200
Subject: [PATCH] fuse: fs-verity: aoid out-of-range comparison

clang points out that comparing the 16-bit size of the digest against
SIZE_MAX is not a helpful comparison:

fs/fuse/ioctl.c:130:18: error: result of comparison of constant 18446744073709551611 with expression of type '__u16' (aka 'unsigned short') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
            ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This either means tha tthe check can be removed entirely, or that the
intended comparison was for the 16-bit range. Assuming the latter was
intended, compare against U16_MAX instead.

Fixes: 9fe2a036a23c ("fuse: Add initial support for fs-verity")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/fs/fuse/ioctl.c b/fs/fuse/ioctl.c
index fdc175e93f74..c85b51ca7c86 100644
--- a/fs/fuse/ioctl.c
+++ b/fs/fuse/ioctl.c
@@ -129,7 +129,7 @@ static int fuse_setup_measure_verity(unsigned long arg, struct iovec *iov)
 	if (copy_from_user(&digest_size, &uarg->digest_size, sizeof(digest_size)))
 		return -EFAULT;
 
-	if (digest_size > SIZE_MAX - sizeof(struct fsverity_digest))
+	if (digest_size > U16_MAX - sizeof(struct fsverity_digest))
 		return -EINVAL;
 
 	iov->iov_len = sizeof(struct fsverity_digest) + digest_size;

From bd340f4cb7fc43a8594f91de8b9305cc9f7a0f89 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 11 Mar 2021 16:52:40 +0100
Subject: [PATCH] [REVISIT 20210323] ARM: delay: avoid clang
 -Wtautological-constant warning

Passing an 8-bit constant into delay() triggers a warning when building
with 'make W=1' using clang:

drivers/clk/actions/owl-pll.c:182:2: error: result of comparison of constant 2000 with expression of type 'u8' (aka 'unsigned char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        udelay(pll_hw->delay);
        ^~~~~~~~~~~~~~~~~~~~~
arch/arm/include/asm/delay.h:84:9: note: expanded from macro 'udelay'
          ((n) > (MAX_UDELAY_MS * 1000) ? __bad_udelay() :              \
           ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~
arch/arm/mach-omap2/wd_timer.c:89:3: error: result of comparison of constant 2000 with expression of type 'u8' (aka 'unsigned char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
                udelay(oh->class->sysc->srst_udelay);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Shut up the warning by adding a cast to a 64-bit number. A cast to 'int'
would usually be sufficient, but would fail to cause a link-time error
for large 64-bit constants.

Link: https://lore.kernel.org/all/20210323133005.GC1463@shell.armlinux.org.uk/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/arm/include/asm/delay.h b/arch/arm/include/asm/delay.h
index 1d069e558d8d..05a6a347d703 100644
--- a/arch/arm/include/asm/delay.h
+++ b/arch/arm/include/asm/delay.h
@@ -81,7 +81,7 @@ extern void __bad_udelay(void);
 
 #define udelay(n)							\
 	(__builtin_constant_p(n) ?					\
-	  ((n) > (MAX_UDELAY_MS * 1000) ? __bad_udelay() :		\
+	  ((u64)(n) > (MAX_UDELAY_MS * 1000) ? __bad_udelay() :		\
 			__const_udelay((n) * UDELAY_MULT)) :		\
 	  __udelay(n))
 

From 3080c47aa770504f1f9bb5fcd9c4c60147b6f48d Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Sep 2021 13:11:34 +0200
Subject: [PATCH] [SUBMITTED 20240328] infiniband: uverbs: avoid out-of-range
 warnings

clang warns for comparisons that are always true, which is the case
for these two page size checks on architectures with 64KB pages:

drivers/infiniband/core/uverbs_ioctl.c:90:39: error: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        WARN_ON_ONCE(method_elm->bundle_size > PAGE_SIZE);
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONCE'
        int __ret_warn_on = !!(condition);                      \
                               ^~~~~~~~~
drivers/infiniband/core/uverbs_ioctl.c:621:17: error: result of comparison of constant 65536 with expression of type '__u16' (aka 'unsigned short') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (hdr.length > PAGE_SIZE ||
            ~~~~~~~~~~ ^ ~~~~~~~~~

Add a cast to u32 in both cases, so it never warns about this.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/infiniband/core/uverbs_ioctl.c b/drivers/infiniband/core/uverbs_ioctl.c
index f80da6a67e24..e0cc3ddae71b 100644
--- a/drivers/infiniband/core/uverbs_ioctl.c
+++ b/drivers/infiniband/core/uverbs_ioctl.c
@@ -90,7 +90,7 @@ void uapi_compute_bundle_size(struct uverbs_api_ioctl_method *method_elm,
 		ALIGN(bundle_size + 256, sizeof(*pbundle->internal_buffer));
 
 	/* Do not want order-2 allocations for this. */
-	WARN_ON_ONCE(method_elm->bundle_size > PAGE_SIZE);
+	WARN_ON_ONCE((u32)method_elm->bundle_size > PAGE_SIZE);
 }
 
 /**
@@ -636,7 +636,7 @@ long ib_uverbs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	if (err)
 		return -EFAULT;
 
-	if (hdr.length > PAGE_SIZE ||
+	if ((u32)hdr.length > PAGE_SIZE ||
 	    hdr.length != struct_size(&hdr, attrs, hdr.num_attrs))
 		return -EINVAL;
 

From c47a0d27c29bcac2ea5ac9d8b0313258b19bcee4 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Sep 2021 13:41:53 +0200
Subject: [PATCH] [SUBMITTED 20240328] ipv4: tcp_output: avoid warning about
 NET_ADD_STATS

Clang warns about a range check in percpu_add_op() being impossible
to hit for an u8 variable:

net/ipv4/tcp_output.c:188:3: error: result of comparison of constant -1 with expression of type 'u8' (aka 'unsigned char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
                NET_ADD_STATS(sock_net(sk), LINUX_MIB_TCPACKCOMPRESSED,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/net/ip.h:291:41: note: expanded from macro 'NET_ADD_STATS'
 #define NET_ADD_STATS(net, field, adnd) SNMP_ADD_STATS((net)->mib.net_statistics, field, adnd)
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/net/snmp.h:143:4: note: expanded from macro 'SNMP_ADD_STATS'
                        this_cpu_add(mib->mibs[field], addend)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_add'
 #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
<scratch space>:187:1: note: expanded from here
this_cpu_add_8
^
arch/x86/include/asm/percpu.h:326:35: note: expanded from macro 'this_cpu_add_8'
 #define this_cpu_add_8(pcp, val)                percpu_add_op(8, volatile, (pcp), val)
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/include/asm/percpu.h:127:31: note: expanded from macro 'percpu_add_op'
                              ((val) == 1 || (val) == -1)) ?            \
                                             ~~~~~ ^  ~~

Avoid this warning with a cast to a signed 'int'.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 479afb714bdf..00bf6c1639be 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -188,7 +188,7 @@ static inline void tcp_event_ack_sent(struct sock *sk, u32 rcv_nxt)
 
 	if (unlikely(tp->compressed_ack)) {
 		NET_ADD_STATS(sock_net(sk), LINUX_MIB_TCPACKCOMPRESSED,
-			      tp->compressed_ack);
+			      (int)tp->compressed_ack);
 		tp->compressed_ack = 0;
 		if (hrtimer_try_to_cancel(&tp->compressed_ack_timer) == 1)
 			__sock_put(sk);

From 8493af46865dd6a7f77dd7d8379181ac2b07e723 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 Sep 2021 12:50:07 +0200
Subject: [PATCH] [SUBMITTED 20240328] rbd: avoid out-of-range warning

clang-14 points out that the range check is always true on 64-bit
architectures since a u32 is not greater than the allowed size:

drivers/block/rbd.c:6079:17: error: result of comparison of constant 2305843009213693948 with expression of type 'u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
            ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is harmless, so just change the type of the temporary to size_t
to shut up that warning.

Fixes: bb23e37acb2a ("rbd: refactor rbd_header_from_disk()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index af0e21149dbc..1bb55827d18d 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -6054,7 +6054,7 @@ static int rbd_dev_v2_snap_context(struct rbd_device *rbd_dev,
 	void *p;
 	void *end;
 	u64 seq;
-	u32 snap_count;
+	size_t snap_count;
 	struct ceph_snap_context *snapc;
 	u32 i;
 

