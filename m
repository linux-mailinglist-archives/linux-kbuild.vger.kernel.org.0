Return-Path: <linux-kbuild+bounces-10532-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9822ED1555B
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 21:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A10CB30275DD
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 20:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40B433F8CF;
	Mon, 12 Jan 2026 20:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fcrLqdsd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F05E326D65;
	Mon, 12 Jan 2026 20:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768251231; cv=none; b=VFkXrietm4a5gy4v1jkwxq6T2oz/nFc5u119CM4bUnH31AUqGWL8unDwKIAVehPVgYWS8EhgnjlG+70qa8hD9zNmmtU/nunrdd4t8vBDOmautmu/SSXWwcZmg58IuwV6MvxEIk+lQHPSjnPvsHO0M8BkLKbtYvLP2JGyk40Q7vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768251231; c=relaxed/simple;
	bh=ie6Omrxq/W/eHhSqr4UBVGDnspkDc0hgmQPM9XYQErE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lrei+/1FGqory6IFspFjuKuXXBPP8QIBRsafbtRQj9+dT/ilxn/ZhWwl1vWFy3QAANHSXK1KCZYDQD8ks3fIJlzFcrjklNMYvwES7KAUTwyEHJgQXDMATUmD08bZJ/PtgA+VPsf3egjTaBNmNkmPc7diXB78LGmcEAoRIwV9emg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fcrLqdsd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3ADAC116D0;
	Mon, 12 Jan 2026 20:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768251231;
	bh=ie6Omrxq/W/eHhSqr4UBVGDnspkDc0hgmQPM9XYQErE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fcrLqdsduaGm44osSwSPN2OmTnmHZDSQTFb+vK0TurhdOmTd+b6joebWJi7ugwjuM
	 WAHPqx2kg9/40sYmNYjfjQbCWB9501/dcWnfmb2MvGsFNmueEUtnhrPsolxdg7YyDE
	 oZydjAYwQP6P01xZ9qoo4MmQ4flizTLO+ilJD9LM=
Date: Mon, 12 Jan 2026 12:53:48 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Maciej =?ISO-8859-1?Q?Wiecz=F3r-Retman?= <m.wieczorretman@pm.me>
Cc: corbet@lwn.net, morbo@google.com, rppt@kernel.org,
 lorenzo.stoakes@oracle.com, ubizjak@gmail.com, mingo@redhat.com,
 vincenzo.frascino@arm.com, maciej.wieczor-retman@intel.com, maz@kernel.org,
 catalin.marinas@arm.com, yeoreum.yun@arm.com, will@kernel.org,
 jackmanb@google.com, samuel.holland@sifive.com, glider@google.com,
 osandov@fb.com, nsc@kernel.org, luto@kernel.org, jpoimboe@kernel.org,
 Liam.Howlett@oracle.com, kees@kernel.org, jan.kiszka@siemens.com,
 thomas.lendacky@amd.com, jeremy.linton@arm.com, dvyukov@google.com,
 axelrasmussen@google.com, leitao@debian.org, ryabinin.a.a@gmail.com,
 bigeasy@linutronix.de, peterz@infradead.org, mark.rutland@arm.com,
 urezki@gmail.com, brgerst@gmail.com, hpa@zytor.com, mhocko@suse.com,
 andreyknvl@gmail.com, weixugc@google.com, kbingham@kernel.org,
 vbabka@suse.cz, nathan@kernel.org, trintaeoitogc@gmail.com,
 samitolvanen@google.com, tglx@kernel.org, thuth@redhat.com,
 surenb@google.com, anshuman.khandual@arm.com, smostafa@google.com,
 yuanchu@google.com, ada.coupriediaz@arm.com, dave.hansen@linux.intel.com,
 kas@kernel.org, nick.desaulniers+lkml@gmail.com, david@kernel.org,
 bp@alien8.de, ardb@kernel.org, justinstitt@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for
 x86
Message-Id: <20260112125348.124d201ef2baf762561a43af@linux-foundation.org>
In-Reply-To: <aWU-oL8oYS_PTwzc@maciej>
References: <cover.1768233085.git.m.wieczorretman@pm.me>
	<20260112102957.359c8de904b11dc23cffd575@linux-foundation.org>
	<aWU-oL8oYS_PTwzc@maciej>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Jan 2026 20:08:23 +0000 Maciej Wiecz=F3r-Retman <m.wieczorretman=
@pm.me> wrote:

> >OK, known issues and they are understandable.  With this patchset is
> >there any way in which our testers can encounter these things?  If so
> >can we make changes to protect them from hitting known issues?
>=20
> The gcc documentation states that the -fsanitize=3Dkernel-hwaddress is
> similar to -fsanitize=3Dhwaddress, which only works on AArch64. So that
> hints that it shouldn't work.
>=20
> But while with KASAN sw_tags enabled the kernel compiles fine with gcc,
> at least in my patched qemu it doesn't run. I remember Ada Couprie Diaz
> mention that passing -march=3Darrowlake might help since the tag support
> seems to be based on arch.
>=20
> I'll check if there's a non-hacky way to have gcc work too, but perhaps
> to minimize hitting known issue, for now HAVE_ARCH_KASAN_SW_TAGS should
> be locked behind both ADDRESS_MASKING and CC_IS_CLANG in the Kconfig?

Yes please - my main concern is that we avoid causing any disruption to
testers/buildbots/fuzzers/etc.

