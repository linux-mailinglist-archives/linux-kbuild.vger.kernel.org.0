Return-Path: <linux-kbuild+bounces-11796-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLUaDBVvsGmNjAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11796-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:20:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89930256FC2
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B66930C49D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 19:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9180A3491C2;
	Tue, 10 Mar 2026 19:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="rR9gSYkh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C107E34A3A7
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 19:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773170282; cv=none; b=Emxweshb67/epGy118b6x8RvQnnb3zuYRadwuy7PeXiVRkySPeTo83EAxZ8fwnhBMV4kE8S27n+kt85fs/xgq/kwb8v3mFRmjjyqvWusAh43+2gkOrA/8XSr7Ys5/xxDWKaBg4BjiRK0lPTYCC0dHDdBA0Hwzke3c7WWW8+GLjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773170282; c=relaxed/simple;
	bh=yNkjvj8zK3UszVO/pQmPPu8PEirskW7YGxcg6RWvrOA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ms4eR5YGALMf0XFAUavJGGfHMQYHKI1T8imNNYwyDDlZV79K6TrVz7CV7/KSXBfWF5QTabU8GK4JJK1EzDpybv1NM4xriSJoIf98nFcQqLNSFtIDGmbUF5amAtqGTvXM/sLsw9IcYD2DIDUydTINBTCqUzN1+1ytW8dUTyu3LBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=rR9gSYkh; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773170277; x=1773429477;
	bh=qoHZk/OhrSl6MrxG5Mj/wzOQ+Ag6/K1R4s+ErDzpvw0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rR9gSYkhvunRslGRTcO93zUtjG4S9QPohyc7ONkvqctlqRe5PAr6eHvbGcQDs36n3
	 33yQN5T+ps4YqoZEpt+gLyhdwBysz/a2OO5acn6s5y8CxSR9RWbUEH0PIVT6p2UtCC
	 +uztI4Plu+Gmk2sFw6yDf1p441e0Y4cmuh6BD8HOGwl+MQRtA42Sm5SodKs90+7Td2
	 wlE34NSb2zzCAQpxCfImaeT7NnWInHxaoALO26ADLN7txCDcMhSVsLhxaqpIcUfY1l
	 2ik5c5wMsrTJTnUVu9RSRaIDQtui9rXEXNSCN8Gl9GupewNhLmIv1OHtkTl1zTwqU0
	 2OvHHg0vin3Mw==
Date: Tue, 10 Mar 2026 19:17:43 +0000
To: Andrew Morton <akpm@linux-foundation.org>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: urezki@gmail.com, ryan.roberts@arm.com, kevin.brodsky@arm.com, samuel.holland@sifive.com, dave.hansen@linux.intel.com, jeremy.linton@arm.com, peterz@infradead.org, weixugc@google.com, ljs@kernel.org, ryabinin.a.a@gmail.com, rppt@kernel.org, bp@alien8.de, luto@kernel.org, jan.kiszka@siemens.com, mingo@redhat.com, david@kernel.org, mhocko@suse.com, andreas@gaisler.com, kas@kernel.org, Liam.Howlett@oracle.com, morbo@google.com, thuth@redhat.com, catalin.marinas@arm.com, ankur.a.arora@oracle.com, kbingham@kernel.org, nick.desaulniers+lkml@gmail.com, andreyknvl@gmail.com, dvyukov@google.com, corbet@lwn.net, leitao@debian.org, hpa@zytor.com, tglx@kernel.org, yuanchu@google.com, ardb@kernel.org, vincenzo.frascino@arm.com, tabba@google.com, joey.gouly@arm.com, nsc@kernel.org, will@kernel.org, yeoreum.yun@arm.com, nathan@kernel.org, maciej.wieczor-retman@intel.com, skhan@linuxfoundation.org, axelrasmussen@google.com, osandov@fb.com, surenb@google.com, justinstitt@google.com,
	kees@kernel.org, vbabka@kernel.org, hsj0512@snu.ac.kr, trintaeoitogc@gmail.com, jackmanb@google.com, maz@kernel.org, glider@google.com, linux-doc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, workflows@vger.kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v11 00/15] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <abBpbS3tplFSlVgx@wieczorr-mobl1.localdomain>
In-Reply-To: <20260310112421.8ceb7415e14b49cbd86db715@linux-foundation.org>
References: <cover.1773164688.git.m.wieczorretman@pm.me> <20260310112421.8ceb7415e14b49cbd86db715@linux-foundation.org>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 0e6fddfcfa9693d70ed9e03b42a5ca69edab13d7
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 89930256FC2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,arm.com,sifive.com,linux.intel.com,infradead.org,google.com,kernel.org,alien8.de,siemens.com,redhat.com,suse.com,gaisler.com,oracle.com,lwn.net,debian.org,zytor.com,intel.com,linuxfoundation.org,fb.com,snu.ac.kr,vger.kernel.org,googlegroups.com,lists.linux.dev,lists.infradead.org,kvack.org];
	TAGGED_FROM(0.00)[bounces-11796-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.wieczorretman@pm.me,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,wieczorr-mobl1.localdomain:mid]
X-Rspamd-Action: no action

On 2026-03-10 at 11:24:21 -0700, Andrew Morton wrote:
>On Tue, 10 Mar 2026 17:51:19 +0000 Maciej Wieczor-Retman <m.wieczorretman@=
pm.me> wrote:
>
>>
>> [1] Currently inline mode doesn't work on x86 due to things missing in
>> the compiler. I have written a patch for clang that seems to fix the
>> inline mode and I was able to boot and check that all patches regarding
>> the inline mode work as expected. My hope is to post the patch to LLVM
>> once this series is completed, and then make inline mode available in
>> the kernel config.
>>
>> [2] While I was able to boot the inline tag-based kernel with my
>> compiler changes in a simulated environment, due to toolchain
>> difficulties I couldn't get it to boot on the machine I had access to.
>> Also boot time results from the simulation seem too good to be true, and
>> they're much too worse for the generic case to be believable. Therefore
>> I'm posting only results from the physical server platform.
>>
>> =3D=3D=3D=3D=3D=3D=3D Compilation
>> Clang was used to compile the series (make LLVM=3D1) since gcc doesn't
>> seem to have support for KASAN tag-based compiler instrumentation on
>> x86. Patchset does seem to compile with gcc without an issue but doesn't
>> boot afterwards.
>
>So LLVM works partially and gcc doesn't work at all?

The non-working options are disabled in Kconfig so right now only outline K=
ASAN
with LLVM works fully.

>Do we know which compiler people are using?  Google tells me that
>Android, ChromeOS, and OpenMandriva use LLVM.  That's pretty thin.

I don't have any numbers on this matter, from working on this I only got th=
at
there is much more KASAN traffic around clang. So I thought that most KASAN
users prefer LLVM.

>This is all rather problematic and it isn't clear (to me) how to
>proceed at this time.  Do we have any projections on when all this will
>be fixed up?

My understanding is that there is something off in gcc support. I recall An=
drey
Konovalov mentioning that gcc also doesn't work well with arm64's KASAN
tag-based mode. As for LLVM inline support I do know the codebase a bit so =
I got
some WIP patches there. But I wanted to see where this review process goes
before posting to LLVM.

>> The series is based on mm-new.
>
>I actually carry kexec patches in the mm-nonmm-[un]stable branches.
>But the series applies OK anyway.

Should I base this patchset on top of mm-nonmm-stable in the future? I was =
after
one patch by Andrey Ryabinin that was in mm-new and I needed to rebase on t=
op of
it.

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman


