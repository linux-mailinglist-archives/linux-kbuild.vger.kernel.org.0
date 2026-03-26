Return-Path: <linux-kbuild+bounces-12286-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOh+HFhpxWl1+AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12286-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 18:14:00 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7A2338F88
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 18:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1969E3028431
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 17:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB4D2BE641;
	Thu, 26 Mar 2026 17:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CK4UL+8e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819CF1CEAC2
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545237; cv=pass; b=EvXvpRnfBXRBFIuZVci3uAZs4+vPq3JtcygorC9MliZB2sJZxdfXzR7iHt4FsD8glrSgqckDZGH4spxhcO8n6hX43Vy5Rxf+wExKWyVbQsdgAOejhnqZeE7oNL3IXJTDSBIqL0ZTXE7e3joG62QdN3q61eIuRxs6/Q2tJK9h8p4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545237; c=relaxed/simple;
	bh=6by8ax6LVBtJzT2zeIYIiNytwNlMq82fUxqHhZGAH/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NzCg194DlJbFSSlxAYRe7DGJ9aWoTNgBiswtNRy81NtX1v7IFFCPCwFNt4WhGfQT8uFYcKcNKsugZsWqkSWvkRhmv0ImlW/TdN0N7iEemZCfc5+h6wcacFpJeXS3RafI/27gTNbyHGvWW8Wv4/+ouIpzg/Wl+YSoxV7dMS4D59o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CK4UL+8e; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c153272250so152320eec.2
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 10:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774545236; cv=none;
        d=google.com; s=arc-20240605;
        b=k0LPAwLxdvZ72oolMtqG3G3/+CI3rQTTjl8prv8o24tLKGlk36/YXid7ZGM3YSPeBM
         rDX8NMPGv+XV0nUU3/SH9HV53ZyA/OBeJH6wwuK9mQlUbhHSUS/vVlZYP5iWFjWs/YG5
         8TqmLOhdkY2d6g203rUFTCWIjjCScIItcORcvmRu94kjYP8vDa0ZzxRlxvEbSqJEkJon
         bqsPH5xhVbU/uauY2aPM1ZJQAeXd9jOAx+24wb3MopSbMBFgvn4xCyrPMuEjdfxLGpRU
         XWhzSRZJzV/4Op/Rg90r0cjPiZxhbnhyQIeD4UITNEzSXbavj3fNrWl+iqNOQmxzS/jN
         8Ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=;
        fh=hOjPif0BMhREvMLg2dkolJVx7PLXHG1M5X+GY17c8kE=;
        b=T+jxsunEdB93YJABIz3LKGZjEHl/pr+xFLaCheGudnl7YHcyusZOXrMBhOnteMuBkT
         JsOjna27ZLuav6CzShlLv1V0kn56dT4Wy6jQRb1SxGbuJtswkTSPef2iJMODxpyg5UGw
         aU46ALtVlL58CmsyyDCyCvbdTj+OpiT8U2QZ5xMKtuxgSbKWs+4SNkgnoCZlxtc+5Lsp
         7nBZSDH8f1v6fZYkM1WIZ5kFzd+Qep5Y2B0+tSf4LWIq+Asr7a8dDRAUXJdf8rd0hVkS
         wfi4uIMncQ856RwGrDoWRoLL6u1k30frDw2v4CUdlwxdey1LDkoXWzWGkLfZaQHsumoX
         GUDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774545236; x=1775150036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=;
        b=CK4UL+8e12gPQDtYaxpXtAkHxqglT8MNtTBLATtjesAMdOVSFdfSFsAMlZhsByvT2S
         OVzIyRub/J3wsgfeGHTbe/ZeBjstIea/k/bSEMALoxmDt7mmQKxpoe3gFxXhACLRn85T
         YXlhQep1SmJOb02AeDNyZEk6tvRIdDp1CwCLI0FilvcZFAk0qoNzZrO8qzDpfFVdw65Q
         R8SkOxWeWr3k1SG3SXBKKdUFz5UEobNguXLBkua50iwp1+DX4BHwcrlJ2f9j+50p+s/V
         HFL1uPhtP4443x8u/QU9GqmmvxWrAaLsl8TZJeWvlgALKGJJVI0Lg0WM+F7+nmySACmw
         thgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774545236; x=1775150036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9olrJwKlMERMQc61vOT8vZB7QpsPZJixmRhhkJf9iI=;
        b=VHlXau9IuxsalZNphVnLJLWmfslp2O6Fxv6PTu++uVCHCjZxPAM6iVbJygaXi9GulL
         phNNpo57kZiSmiUvie4ySXnDZMFJL/vpOsgN4c+JuUhw6NT7uvXFxQefxDCUzy9nMBUO
         pXKqakRWFtklUBSq+H9KUipRBgaOAb1JW3G3ygrXYNaFDnNmJ24keg3N1fnyA3DY1xjt
         n+8+/AdX8qPyoLf3T19Vq0Lv5nrb58fXZV0iSnt0L4zf+J2psOV3l9kJgOVBYra9bCP2
         Uhf+cQK25Ygkdyaqy72HAvRH4S7bOgCPU6jKE5W93VM2yHjc1ESnE2fuuF1urf1Yx5i6
         g87Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBJG68tmvlWpZd/9Opc3usjThiI3EKcckC5rjBA+/ZyVhGbzin7O12vjJSu+3N22jiWI0kOUcyfWRJvhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5qL0fiY9eevChI3fIwIWQk9e0ZIUKnJr8ztQdF9BRnRB/W852
	68siOTrmRI3J1rLjbF0nhKJEPVtcsiVaWsCiab3REeDkMfTtzgtDY0RlPTORwmrC7Jf6aDkbV6H
	KMGShKbit6xGJ/yDGeiXnyMmhSCvsWE8=
X-Gm-Gg: ATEYQzwC/HYjijYOVIztYsqhPxIiHxELqt3qVchtRKynQuNAoXkliajOOrg+s4TR3Tr
	7vkU3pCpF4+343UALrbM7J4tGeRjkvvymybUuR8kVHGiHxOqv8UkJB4Mx6SIPYDjVH7TugGcXqy
	R92bFXZAAG2SBVSOLNwzvPqYCnV0MWEsQ03we/xWVF55BcF30mzJIphAgLNmU+6CZfwCLLn645d
	e4b3nafg1Obk+CwsVksqRHtr/8sXqgnIE2qgffTQtaJd4bmqShFqszKVfhjSqe50IajVtEwkrdX
	H9Q6tmf65wcGcz+9uKYm6EAs/0uedyI4scf3DPWJjRiOdvRzQ9k39Sakgdf0V3c4YRk1ySs5Osj
	acA+QJzQdKXNsza8bqmJbcpA=
X-Received: by 2002:a05:7301:5f8a:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2c15d282067mr2407895eec.2.1774545235402; Thu, 26 Mar 2026
 10:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260322192159.88138-1-ojeda@kernel.org> <20260326024226.GB2302780@ax162>
In-Reply-To: <20260326024226.GB2302780@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 18:13:41 +0100
X-Gm-Features: AQROBzCjsVmkmyxhYBQlcnjNfjk1drusXCGXl2NpoBVYAfyx4urVLgdrjE0kdQk
Message-ID: <CANiq72kyFu4StTPbobkPBSMYxNa5T0uErkLj-6mRvwOquEsgSA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, soc@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, David Gow <david@davidgow.net>, 
	Russell King <linux@armlinux.org.uk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	aliceryhl@google.com, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, linux-mm@kvack.org, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, nicolas.schier@linux.dev, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	urezki@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12286-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[46];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,davidgow.net,armlinux.org.uk,nod.at,cambridgegreys.com,sipsolutions.net,lists.infradead.org,lists.linux.dev,vger.kernel.org,nvidia.com,linux-foundation.org,protonmail.com,garyguo.net,kvack.org,arm.com,linux.dev,infradead.org,umich.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F7A2338F88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 3:42=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I do agree with some of the concerns that adding an architecure
> dimension to this is a little complicated. I would rather try to flush
> out those build problems with patches and keep it enabled for all
> architectures. At the same time though, I understand that enabling it
> for the "tier 1" architectures is a low barrier of entry for getting the
> feature upstream, validated, and distributed to the majority of people
> that would actually use and depend on it, so I ultimately leave that
> call up to you.

Thanks! I agree that it would be ideal to get it clean everywhere, but
given it is experimental and that arch maintainers should likely known
about this, I think it is best to start simple first.

In fact, let me Cc the x86 and arm64 maintainers so that they are aware.

My current thinking is that I will add:

  depends on ARM64 || X86_64

and try to land it this cycle.

My understanding is that this will be used at least by Google, mostly
for Android (and mostly arm64, but possibly x86_64 too), so I think at
least arm64 will see some actual users on an ongoing basis, i.e. apart
from the "synthetic" testing I was doing.

> No real concern on that front but .gitignore has a command to run when
> modifying it, which will require a !timeconst.bc in a
> kernel/time/.gitignore file.

Yeah, that is the exception I mentioned. Initially I thought about
putting it in a local `.gitignore`, because local is best. But another
option, with a different kind of locality, is keeping the exception
close to the rule, i.e. in the global one, which has the advantage of
showing us all the exceptions easily (and being able to write a
comment for all of them at once).

I am not sure what is best clearer, but I am happy to do either:

    diff --git a/.gitignore b/.gitignore
    index 3a7241c941f5..3044b9590f05 100644
    --- a/.gitignore
    +++ b/.gitignore
    @@ -13,6 +13,7 @@
     .*
     *.a
     *.asn1.[ch]
    +*.bc
     *.bin
     *.bz2
     *.c.[012]*.*
    @@ -184,3 +185,6 @@ sphinx_*/

     # Rust analyzer configuration
     /rust-project.json
    +
    +# bc language scripts (not LLVM bitcode)
    +!kernel/time/timeconst.bc

Thanks again!

Cheers,
Miguel

