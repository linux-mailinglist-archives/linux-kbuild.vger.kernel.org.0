Return-Path: <linux-kbuild+bounces-12687-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMLhKF+z02kdkgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12687-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 15:21:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 306503A37F3
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 15:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D0263011BDB
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 13:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5F937267F;
	Mon,  6 Apr 2026 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3tAGxOy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956C93290C3
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Apr 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481690; cv=pass; b=sLDrjCAuLFnPjzTcpmis0V/1apcgIaooGKl49U6ug9VoEif6P0aCTdaMVNvw5zEjBK2SpIXlWrrhjkJhbapgNIJYSZVelhDzVEmH1uQqMWfBO7C3usBfqwL7iRvpRgDB7TVZO1DMBN0BjWvDNspKeWeVOCurFqdmkdJMF3xb3P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481690; c=relaxed/simple;
	bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Od3Sl8y+EfuNZoKTasErAdkBA/FOiV3IxSZoya0HTYw0UtPDhFDnDOJ/KMSK5JO+qpeDC4G0zbRwLySXQIMPO4HNAJwUT1tkms9skAd8MNOZrbclNPVueDTd60sVUEm0ZefSgaGN8IM/gP55sNB/RUKKgjDdgbkngFkawaXWY0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3tAGxOy; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-124a7216c9cso161693c88.0
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Apr 2026 06:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481689; cv=none;
        d=google.com; s=arc-20240605;
        b=bs42Us5zN4M/yLfnAzKUL68b5Jru5QMRjqgndyEzoJko275fuyagQg+ssmRClnXiIq
         Tqa4Z14QDzkzMPJgcCpZkI8S5wjSX0uYCIN0uiqipqzAQVWhVHxTUIkHIie2vk9wM34f
         oY6rrnKyJPBmSIv/68KzoffkJ+xA9x+PvPkQ8CTM9UK0rCMWVy5VQcQhSfRBjXE39jhJ
         mRwh/+eIjYmvBt5MM5JO4kOg39xOZ7K2vCjPTImSlWKNlSVkKblIw5yxHhy3HN0dHLk1
         4tQNvLpYUsyU2wJ9AH7U6rT1Jy3fPko/i+Liib6vgJAu6C3n81Y6rnwmiC1scdx823Dc
         czxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        fh=NRABJki91CD2/ZL9VWzcsLE8QEsNaJspSgYqaxxwPig=;
        b=lhkJ197kC+FpFQ8J0k47f+eWz5gvZmMidov6fdYPYxudWItEv7qEjCoZA2grEKs/vN
         6Iay1rrHi7iiQdq3PlwlGNk4gokwUKQrkeO1WLXfPKxuLUcyKK4GqsLr4cHnv7J8Igny
         NG75EK+oTTKZd6NAaB5JWqxch07BxwJaip4qlQ90x3sNG2Mw/rOO9IHWua5bzuMYLVmy
         bDVeOIJuyF4q69qTMwgggt83SUFIDhTta31/N81H8jqr3Zyro9FmGldlk9GNcNlr0In0
         JJiZyLqGglYdNQiBlVAHXDCOenfuONIzlWx47qQ+IT8543huBXl9JtSkp+KPKOvxWocS
         6sSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775481689; x=1776086489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=q3tAGxOyAaMZ92oiBATu8FQ/6qRm0r9euxaNK8TPoIYKXv+sip60zW3/mf/067CojG
         I91sgXn7EWKEojoel0sfV0c2x47kc1MhplILMewUkwkZaBCCr0pwNk93ApwnYy0wO6yk
         wzk4NsK4gNw4WQ5HLxHU+akS5jt/VzZUPL7mw5Z8fzT8N/hLAXQzM5TXL+PsqtJbutvi
         8uYoJs3WHDvwOVOtXEYQeWWHvCxe1gwgZnfpVYwrKTEHNlI01LkDdq0Wvn9M2UetAjbD
         lUoBO1OKkgxrsLb7uoE6JiAt9LFTPTHQt2L5Jm/D7L6biFMlveXZMrm6ibprSlWxXpbe
         +9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481689; x=1776086489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=q0ml0/8BT8cblp/miMO7czsqhhPSE1oEHnyePJUC/x0KFDZSOCljudl5m8A7AZC86+
         F81c5lLSPBcXi1oWneZoTcFWusaKDvJCT3rQogOPz9/9qYm6s43qaJ+jEjeaNao9pJ28
         bsUNK0vVmq0iEuWeBwzZrZoq/ibyJNgg8IWqIl30tcqZHwUKOUVXClivyIMIdE/rKphi
         IYioz335gh8ZipW5dXXrI1AItPavNZfe36ZrRYFxA65vu7+GnWsHIL0BeiCXP03fKtMN
         CNjdALipP/c6eDdn6cMiVmpnrEQSUgt4LbKf68FarB01yRZqp9h//qV22c1DWM8vn4iO
         NTRw==
X-Forwarded-Encrypted: i=1; AJvYcCUmvPftJOhaeHwPPLe4hj2g6W6nizI1lNanXclKk3Qt2OqzqnIP5/u4x3LjhE89lWkNAFEftCYjX0Pv6lA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVkuVwUhcAGxlTcBYXAHzN0D6tbI0afo/AxlKk8FIuZQ3SmSrZ
	F5IdlG0qg0JictUG1KtMb+vc8OCb220yvgnW4FoS9jCuKF5sHZ/v5W+QmFsL78cQvccx/bA2ZBm
	9Ed0oMIKRE7Ilpol87httaVyCFXKQX8c=
X-Gm-Gg: AeBDiese17Z4CIzuwVexhaVkDnJT/M2VFRJB0ZGxA5ONc8fzfg3AHrbgQ+3k4ut+63y
	KEBPrCOnHt5MBecXG/Zy+/hhXJUv3w3GsiIwgZWKBiGyhJI/zx+6qe7C45pPwm4TNuU6y8DT6S1
	cOwHpOIAY8TUPZ7EDFqdD9ef8rsPjCvf2CVgidnm4iCXeJC8SFYU3VOx6bY1oxIYNlyN+mO03bg
	VNn99/FRNcbUxds+/0TO7k6qrY+dN6V6ICx24NIMWtCysNT7hBPa+yWJJePee49y/SudRk2C/oF
	5gG0rNCRBJSYsCDgYZBBtKnj70SBplHaD9T9bbnC13Sv18TompqTqt3WMlQFVzPbPWXvizDbHVc
	gBcJp0fTSP30Qg51y4pCSsPc=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr2965052eec.3.1775481688630; Mon, 06 Apr 2026
 06:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-34-ojeda@kernel.org>
 <177508434476.73816.11744805605122440072.b4-review@b4>
In-Reply-To: <177508434476.73816.11744805605122440072.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 15:21:15 +0200
X-Gm-Features: AQROBzA0LUfPYuEZWH9uKj1KexaW3DTNKfQ_If4tWD7xnq1YUXDcYUMRbV47V4E
Message-ID: <CANiq72=25GRao7NciojymdbZN_=f-U3hp2+2qBMjb4VCaOgR2w@mail.gmail.com>
Subject: Re: [PATCH 33/33] rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12687-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 306503A37F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 1:02=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Might be good to retain some of this in a code comment.

Bah, I missed this note among the rest, sorry (I didn't reply to the
ones where the commit went away due to the changes in v2) -- I agree
it wouldn't hurt to remember why it is there, even if it is already in
the Git log.

I will probably add it for tomorrow, especially if I have to rebase.

Thanks!

Cheers,
Miguel

