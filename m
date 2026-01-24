Return-Path: <linux-kbuild+bounces-10856-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D/2DQC3dGkM9AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10856-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 13:11:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5557D93C
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 13:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B67A305DF2E
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 12:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4F92DBF4B;
	Sat, 24 Jan 2026 12:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=svenjoac@gmx.de header.b="c6TcB37a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584C5229B36;
	Sat, 24 Jan 2026 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769256320; cv=none; b=Ibgmsa7nvwc06oYM1BP+9UB8NcFSzdOPLe5r/sjE1Q4s9xpJczjEyi3frEQ3fZ3qlS3uFzpE31XbBJ8nDXjenApjhs6suRK5KUyjMOmLDYOEkYSOD4rhVA4pgjaXl58sUHPq+t5FyCX2nqmLLa9h4o8ywo8M7pJcXxh6fym3HVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769256320; c=relaxed/simple;
	bh=3Uye4ztg8b5UHDRMTSJrnc2+SJ8QMczi1xXCDcJDASc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oQo7ZxjRZ0o6IwOGeE2B9X8BQp3V0SGHlESPi/oaavbQv+ZiBPDwVdz/LlhcCxgUxNp8HzirfVPZHnAYRx3YD3GTZhk49NEU8ZVjS1NSBc5ry5dd6o1UO2VA2GF5WYRERWu0Yo/UjmI0sIi4uDQvByG5KGSr9y+pcgydStuM+u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=svenjoac@gmx.de header.b=c6TcB37a; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1769256298; x=1769861098; i=svenjoac@gmx.de;
	bh=+PJwupJ3jmzry11XtyInCSt3rZ3u2ecLDqkyHEXPHrI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=c6TcB37az/doU8M9NmNE6xvFSuvVOTVwrEmEmPtekPXd/FV7C9bwAeNsZ3xBdQ3h
	 Md9l2MVjG9LcpY00a/4hpGE2VJlasRHmo56r6Zx+ns40MvzORnJpyYlGeOFCh6+Pe
	 y/za/RoFNgx/Y4A34NCfsXDuKQG2ixfjmKK9C2kGRyO5Sy1R/0drIcUK+QSxls9Dp
	 DKUTIEwmoYadBCwZ/B9kJHoV3TY75xlO2vTgsAkWRet/qMGczQRZnGl1mJ/J90GzI
	 uauDJSac26MuCelqRHiEmJbzyQHYQmllYV3NSem1v2HBE2evK3tQOpaVdH/o5YEaE
	 06KEjXzmSenAJfNFUQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([87.145.214.198]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N7zBb-1voivx0aQN-010cQN; Sat, 24 Jan 2026 13:04:58 +0100
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 491D780087; Sat, 24 Jan 2026 13:04:56 +0100 (CET)
From: Sven Joachim <svenjoac@gmx.de>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,  Matthias Klose
 <doko@debian.org>,  linux-arch@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kbuild@vger.kernel.org,  Arnd
 Bergmann <arnd@arndb.de>,  Peter Zijlstra <peterz@infradead.org>,  Nathan
 Chancellor <nathan@kernel.org>,  Nicolas Schier
 <nicolas.schier@linux.dev>,  Binutils <binutils@sourceware.org>,  Steven
 Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC] Don't create sframes during build
In-Reply-To: <jdw2iyr2dd6fzasbiwbzsaqohbi46hwd7wb3ze6qhztje2b6ld@qnween3ajj5e>
	(Josh Poimboeuf's message of "Thu, 4 Sep 2025 10:14:09 -0700")
References: <20250904131835.sfcG19NV@linutronix.de>
	<b3db475e-e84d-4056-9420-bc0acc8b9fe5@debian.org>
	<20250904163404.QMU7nfbA@linutronix.de>
	<jdw2iyr2dd6fzasbiwbzsaqohbi46hwd7wb3ze6qhztje2b6ld@qnween3ajj5e>
Date: Sat, 24 Jan 2026 13:04:56 +0100
Message-ID: <87343vdxnb.fsf@turtle.gmx.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sIuBcAc81apZF9GxbyUD9V9l6W3lubT2aqLbHx9wYbVoscjBvMD
 tE185AX4BrEAwpufYxM2Xvv70A07d60ib/TJer+fYc2t33ULhlClFwifr03vQRpvnp58x0F
 Cc0h9fLCBSomXQbjdJraCkaIDrkS9F24PieWs6ty5EIV1Q3/24dZ/OVebsPJ3HvWjBbuLfp
 WyEtT4aR6iCYNtZQmLYPA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9Q7wO8xADcU=;2L71d+jrx6Vwkipi4lneBtxn4Za
 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
 NLinLTCf6IsQFA8GgdcldPfZGGRR7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10856-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmx.de:+];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[svenjoac@gmx.de,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sourceware.org:email,turtle.gmx.de:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gmx.de:dkim]
X-Rspamd-Queue-Id: BE5557D93C
X-Rspamd-Action: no action

On 2025-09-04 10:14 -0700, Josh Poimboeuf wrote:

> On Thu, Sep 04, 2025 at 06:34:04PM +0200, Sebastian Andrzej Siewior wrote:
>> On 2025-09-04 16:02:42 [+0200], Matthias Klose wrote:
>> > [ CCing binutils@sourceware.org ]
>> >=20
>> > On 9/4/25 15:18, Sebastian Andrzej Siewior wrote:
>> > > Hi,
>> > >=20
>> > > gcc in Debian, starting with 15.2.0-2, 14.3.0-6 enables sframe
>> > > generation. Unless options like -ffreestanding are passed. Since this
>> > > isn't done, there are a few warnings during compile
>> >=20
>> > If there are other options when sframe shouldn't be enabled, please te=
ll.
>>=20
>> No, I think this is okay.
>>=20
>> =E2=80=A6
>> > > We could drop the sframe during the final link but this does not get=
 rid
>> > > of the objtool warnings so we would have to ignore them. But we don't
>> > > need it. So what about the following:
>> > >=20
>> > > diff --git a/Makefile b/Makefile
>> > > --- a/Makefile
>> > > +++ b/Makefile
>> > > @@ -886,6 +886,8 @@ ifdef CONFIG_CC_IS_GCC
>> > >   KBUILD_CFLAGS	+=3D $(call cc-option,--param=3Dallow-store-data-rac=
es=3D0)
>> > >   KBUILD_CFLAGS	+=3D $(call cc-option,-fno-allow-store-data-races)
>> > >   endif
>> > > +# No sframe generation for kernel if enabled by default
>> > > +KBUILD_CFLAGS	+=3D $(call cc-option,-Xassembler --gsframe=3Dno)
>> > >   ifdef CONFIG_READABLE_ASM
>> > >   # Disable optimizations that make assembler listings hard to read.
>> > This is what I chose for package builds that need disablement of sfram=
e.
>>=20
>> I think this would work for now. Longterm we would have to allow sframe
>> creation and keep section if an architecture decides to use it for its
>> backtracing. While orc seems fine on x86, there are arm64 patches to use
>> for as a stack unwinder.
>
> This is probably fine, but... how does this interact with other kernel
> makefiles enabling sframe?  For example, x86 will soon have a patch to
> enable sframe generation for vdso.  And as you mentioned, arm64 will
> enable it kernel-wide.
>
> Removing the objtool !ENDBR warnings would be trivial (and is a good
> thing to do regardless).

What is the status of sframe support in the kernel?  With current
binutils (version 2.45.50.20260119-1) from Debian I could not build
Linux 6.18.7:

,----
| # LD      arch/x86/boot/compressed/vmlinux
|   ld -m elf_x86_64 --no-ld-generated-unwind-info  -pie  --no-dynamic-link=
er --orphan-handling=3Derror -z noexecstack --no-warn-rwx-segments -T arch/=
x86/boot/compressed/vmlinux.lds arch/x86/boot/compressed/kernel_info.o arch=
/x86/boot/compressed/head_64.o arch/x86/boot/compressed/misc.o arch/x86/boo=
t/compressed/string.o arch/x86/boot/compressed/cmdline.o arch/x86/boot/comp=
ressed/error.o arch/x86/boot/compressed/piggy.o arch/x86/boot/compressed/cp=
uflags.o arch/x86/boot/compressed/early_serial_console.o arch/x86/boot/comp=
ressed/kaslr.o arch/x86/boot/compressed/ident_map_64.o arch/x86/boot/compre=
ssed/idt_64.o arch/x86/boot/compressed/idt_handlers_64.o arch/x86/boot/comp=
ressed/pgtable_64.o arch/x86/boot/compressed/acpi.o arch/x86/boot/startup/l=
ib.a -o arch/x86/boot/compressed/vmlinux
| /usr/bin/x86_64-linux-gnu-ld.bfd: error: unplaced orphan section `.sframe=
' from `arch/x86/boot/compressed/kernel_info.o'
| /usr/bin/x86_64-linux-gnu-ld.bfd: error: unplaced orphan section `.sframe=
' from `arch/x86/boot/compressed/kernel_info.o'
| make[6]: *** [arch/x86/boot/compressed/Makefile:116: arch/x86/boot/compre=
ssed/vmlinux] Error 1
| make[5]: *** [arch/x86/boot/Makefile:96: arch/x86/boot/compressed/vmlinux=
] Error 2
`----

Did not test mainline yet, but "git log --grep=3Dsframe master" does not
show anything interesting.

Cheers,
       Sven

