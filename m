Return-Path: <linux-kbuild+bounces-11797-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CJGOmhxsGlujQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11797-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:30:48 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9247E25707F
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E19DA3012BFA
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 19:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D751397;
	Tue, 10 Mar 2026 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="NNYtUTuf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3112CDBE
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 19:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773171045; cv=none; b=TZ22K4tRMH6PChmtXetUZ0IlyUIedtb4jlRfCJsQ5Jcx6LgP+Gy113CPfuRnmgWj/g3R7QZih6uqjgIX0M2/iTdxNR9DP1v2LdmKeK/cbs0FaFGVn4R4wZtPOPrAB5iCiy1VWcuNJX7xyboS1Jvw8hC+tr7f6TZn7Onckq5VcnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773171045; c=relaxed/simple;
	bh=DebX/uKrd8E1cdubk7gVqD5mFHMWz0EBsTGvClcjjLU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KAwvM5Qc+9pOEA7lsS5MOWjxoedGmF0uoj6DmPfRd+ZReu2r3eD9L/NNq5SCcUmj9Ymx/AtWazr9yOj1tqX04+KsixknJOGiKxjMLh0WzKNGj5F9QaFN1g1bxLkxZiFS+HIRijt8oZI1KAPXOG47e91N8X0pQUFB6lxk+koS5fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=NNYtUTuf; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773171042; x=1773430242;
	bh=DebX/uKrd8E1cdubk7gVqD5mFHMWz0EBsTGvClcjjLU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NNYtUTufT6cuK2gc3E3sBQG2y4/1aMcxGYI/3+6ltvtRORBVHg0PdzDYXP8h0g/s4
	 4gikZ/igoaKXzSdiysh94bjtGM/3re9YTzZ7wmKv0lDLKJxpWkqTRgtFXddPz0ED4v
	 ERO+26f0E9y2rIwdKL4WodXyL/Hsw0E+F+oGyCJxysGm5Lodv8BIyYVrHx66zMx/cq
	 d676Pvcr12yESXAuomDZyFPLuDRgX332ei0JVZqSxiLFB0FHH1aId+YikcqE3ozcV0
	 CAaKYUkFstB2d73FF+hgRfcJRAF85qA3g/qFKLTTFpk2djX8mWzmrtwBTUKKs/bmxI
	 Y/2pcg890uG3A==
Date: Tue, 10 Mar 2026 19:30:36 +0000
To: Peter Zijlstra <peterz@infradead.org>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: urezki@gmail.com, ryan.roberts@arm.com, kevin.brodsky@arm.com, samuel.holland@sifive.com, dave.hansen@linux.intel.com, jeremy.linton@arm.com, weixugc@google.com, ljs@kernel.org, ryabinin.a.a@gmail.com, rppt@kernel.org, bp@alien8.de, luto@kernel.org, jan.kiszka@siemens.com, mingo@redhat.com, david@kernel.org, mhocko@suse.com, akpm@linux-foundation.org, andreas@gaisler.com, kas@kernel.org, Liam.Howlett@oracle.com, morbo@google.com, thuth@redhat.com, catalin.marinas@arm.com, ankur.a.arora@oracle.com, kbingham@kernel.org, nick.desaulniers+lkml@gmail.com, andreyknvl@gmail.com, dvyukov@google.com, corbet@lwn.net, leitao@debian.org, hpa@zytor.com, tglx@kernel.org, yuanchu@google.com, ardb@kernel.org, vincenzo.frascino@arm.com, tabba@google.com, joey.gouly@arm.com, nsc@kernel.org, will@kernel.org, yeoreum.yun@arm.com, nathan@kernel.org, maciej.wieczor-retman@intel.com, skhan@linuxfoundation.org, axelrasmussen@google.com, osandov@fb.com, surenb@google.com, justinstitt@google.com,
	kees@kernel.org, vbabka@kernel.org, hsj0512@snu.ac.kr, trintaeoitogc@gmail.com, jackmanb@google.com, maz@kernel.org, glider@google.com, linux-doc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, workflows@vger.kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v11 00/15] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <abBu-M5esEYWScDf@wieczorr-mobl1.localdomain>
In-Reply-To: <20260310190022.GI606826@noisy.programming.kicks-ass.net>
References: <cover.1773164688.git.m.wieczorretman@pm.me> <20260310190022.GI606826@noisy.programming.kicks-ass.net>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: deeac2913fe3968b47380487a2b3c2c800a00e30
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9247E25707F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,arm.com,sifive.com,linux.intel.com,google.com,kernel.org,alien8.de,siemens.com,redhat.com,suse.com,linux-foundation.org,gaisler.com,oracle.com,lwn.net,debian.org,zytor.com,intel.com,linuxfoundation.org,fb.com,snu.ac.kr,vger.kernel.org,googlegroups.com,lists.linux.dev,lists.infradead.org,kvack.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-11797-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.wieczorretman@pm.me,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 2026-03-10 at 20:00:22 +0100, Peter Zijlstra wrote:
>On Tue, Mar 10, 2026 at 05:51:19PM +0000, Maciej Wieczor-Retman wrote:
>
>> =3D=3D=3D=3D=3D=3D=3D Compilation
>> Clang was used to compile the series (make LLVM=3D1) since gcc doesn't
>> seem to have support for KASAN tag-based compiler instrumentation on
>> x86. Patchset does seem to compile with gcc without an issue but doesn't
>> boot afterwards.
>
>Can you put all that under a specific CONFIG and make that depend on
>CC_IS_CLANG?

I made HAVE_ARCH_KASAN_SW_TAGS depend on CC_IS_CLANG, and that controls all=
 the
software tags stuff, like ARCH_DISABLE_KASAN_INLINE through KASAN_SW_TAGS.
And ARCH_NEEDS_DEFER_KASAN is for if KASAN is compiled but LAM is not avail=
able,
so that it gets disabled in runtime.

But sure, I suppose I can add a separate CONFIG with CC_IS_CLANG to these t=
hree
so the clang connection is more transparent.

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman


