Return-Path: <linux-kbuild+bounces-12546-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F+OIsBczWkRcQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12546-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 19:58:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E06CE37EED2
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 19:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47A2F315ABB9
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 17:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219A83E0C44;
	Wed,  1 Apr 2026 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuSB1yrt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD8D3090D9
	for <linux-kbuild@vger.kernel.org>; Wed,  1 Apr 2026 17:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065562; cv=pass; b=IGeUC5tNhzuCELJc7WMM+fOnEHnnIp7huS8Fac0f8lIHsjDuHiH34rP1VB+wyg2fKCN8lhlFMEJq8PKYVji6PRgIofGnYC+29smaa6Ig5HloA3VgaqMCWgSskRMamoOo5ZbQyT3/5HSyGSmjIYuyvBaDyUdL6+3/Kb41Yz5tZIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065562; c=relaxed/simple;
	bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfnnQ6Uol8OxGeUg+ifuHBqc2Gfp5RaFouwkmfOsCYj7av9jYwuiKvtQlz0QcoOZmBdoiZeB4fUgKmwDiwsGFzGXP0CYTkusVBhXxpr+tFxz6aeCwiXMS/pWJBzTddlUO3pznEFZlvUPQDaYiGzhGBz2Lk7eOw7wvw+CnFlOkq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuSB1yrt; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bd801b40dbso11954eec.0
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Apr 2026 10:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065560; cv=none;
        d=google.com; s=arc-20240605;
        b=As1kOQCx6dI4vLmsvVSMX5ZpAFy41Jr9zqTVEyIHJ4aVuy3btx8cD51xvpgqJIJutx
         xSzkfa/uMJZAX9bYy7wzUXIJ/375YxWQo/8JHae97zd4AvXzt8kNSyCU9ujaAJNSAgIN
         MUYIEYKOsFWP93tugVqxE/0kIdA614RtKAVBUQYO0AurGF+Ih4pjN8nEXCiLLHM2T2L5
         9wJjtsBEgehJvXDKfxntX5uMRxxu2JKKmIUZ+cXyOlTHEVdyRWpLUtMYM7JH59o7SxsC
         i5enUGCV+ApNW02He6odSTAY77DENttxdzhr7c+OjlaapBneaIXKNjyv1AIR22v/FadZ
         Mzig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        fh=vHFshx2DF30YmN8/6uJOZtG/OU7tQ3+pcR3E/TAnlhA=;
        b=hXXMKvmWYxbxBQhZr7oLzUeG56YzGEMn1zWZRp6KN76GoYp0NCsKwTJ5IB1/oEHB7c
         Kxv9xu+7kmlSAKAwPdbP9MEVXYrV3KlAo36BPO1aryfy32kvhflQIwQPJb9x4DO0/zXa
         go6E86Ej6Y1+v2B7Tv92D1V5FOzsWWulDKU1PZTxPnPesHv97zExPC6NDNE3N6a8RJvG
         XJfPSP8+VtcViQyENDSH8J+YUxKL+j1ITpIxvnv7uJCM0ON2neUNlVg3WzoYq2gkbdv4
         nqD3144NneW+k176Hn0X3LiYQwcJXcTKztBJC/5mwtxYNb6q3zq+VfIbdYjsQMpwFNvw
         whXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065560; x=1775670360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=KuSB1yrtfd8BjsI6YjeWCq5wxXfLwBoKXUpCsrVo6QhIUPYZyH8YZscFQf+sEFQGSa
         TZa26pVuuui5NNTB3TMLCTlNQdZUd5bNv5ckyZGKLMzmdHhcy7khKoBsPqwALzvfTqMx
         Tx4YahpYBU96LprRTqv163LXmagSQ2UWTUI5fXIc45fHuZJGblCH1AeRl57i/ejTj5Mm
         qxEZ/P7i0pLCCFWwjWNVkYKtF4Ldade03b80tf2gtS6iOo6Vr4UtiKUQABYe6b0oT8sT
         YwPzJUkCLIYKqge/KqQi71RrOh4/b3n6UY1Gp9QJ2fd5NIK8vlg3P30n21TqlTrKxzN/
         SiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065560; x=1775670360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=Kb0KI/Skj8w4HBCnSOpRPNYE7DrZk21P6K5uU9PrEY7OOREPHg4pj3Xr5d609VSPQ8
         YJjI6ptDLrE5ModZvEhuPlEH4Ptr8HdWANNreOi9n9gcbGDixWtv3dPPVJ4u0ER9Cpcd
         wTPr9UXCGTrR9wuRER4xrry52wYDyBes7mhcSl0mPpPZx0PEaB7Mj1L4TSVw1ygL+y3g
         bilqhNMS3RMCJ5gIxPw++CivMIWpI3WwEMEKnZ5i70bmZ9VTungZg68jn93CpBIN+ZsF
         1KG0IbRmyh7iyf+C1gxn3vqSVvMZaYkNjfZZJaUOiTsIjskWucf+xZOhBwhhvhJyVcIV
         yyPA==
X-Forwarded-Encrypted: i=1; AJvYcCX4vlwXeaJIuKyhhNndIWaAGVW7Etz6mH4LDdP+NsX0sq5zUdjXrEpwxBxbjY+mu2yfrHyTAIiQaaJA/vo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypzf1AvDijun+iyyVhFMd1YjLESs+Bgu/K++76WbxSIM9ytNIh
	HlqzihcdYD9Fp/V0Ooj/AV7uMk6PxPUdYHyzup43njWuhYESMx11qfCTVTte0BYZQeQa38zwfyZ
	tlDOBGybxxWJBH7i0ljovklkL8X6V8YE=
X-Gm-Gg: ATEYQzwNK8ElG+H6tPfzInlgrHTfPLSRPNP2DjP1q0QfssuVz87WKBHwnt1oTeWBTJ0
	l4Ya7JPHmvF0zHq8U5kGek3rqq84aE2aNcQx4rs1hA2U+ZFli2+aR6wyXCWKIELt1HDMYZM43LL
	TizLPYM2pjn1VWE82EjX0S6IsyNJmcLoLJ4Jnr9aUjfUQ6iMq2v4qio6/ZROAghME+RS2SCFZWn
	9uCw5pmmXVNxiGgJ/4zqyrNiFB1G7HdeLJEatun541A+D9MfutIE/CGUw90Nd16V6fQDV1LKOT2
	orr6RRl57TYvh8UE4+iBspamJ1CtjkgHdxTKi1K4xChxJGck2xGwU3sHjfznPUJaOcmlpA3FpgL
	/zYFr7oHzScc76awglSYc4O0VxnimlE2cLw==
X-Received: by 2002:a05:7301:2c05:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2c930798a4dmr1033595eec.1.1775065559731; Wed, 01 Apr 2026
 10:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-13-ojeda@kernel.org>
 <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
In-Reply-To: <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:45:44 +0200
X-Gm-Features: AQROBzDasvNfwm3irNcxLclKgLrVzocIHNQudR_c4deB-93-CSbalwIa-aYY_TU
Message-ID: <CANiq72=8eVKk0gqyvgWM_-VSsRZY1s2e7gx9AbAg+q0dRRYO=Q@mail.gmail.com>
Subject: Re: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO comment
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12546-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: E06CE37EED2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> When I write the comment the intention is to enable the unstable feature =
and
> switch.

Yeah, that is what I meant as the alternative in the commit message.

I am OK with either.

(By the way, I wondered why you mentioned 1.85 in the comment, I guess
it was supposed to be 1.86 instead originally, i.e. "above" as in >
1.86)

Cheers,
Miguel

