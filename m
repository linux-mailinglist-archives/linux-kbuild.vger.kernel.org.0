Return-Path: <linux-kbuild+bounces-12644-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJfxDqe50mlEaAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12644-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Apr 2026 21:36:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FD139F7B9
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Apr 2026 21:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2150830062E3
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 19:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F52433A6F7;
	Sun,  5 Apr 2026 19:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkjwnYb5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9A233555F
	for <linux-kbuild@vger.kernel.org>; Sun,  5 Apr 2026 19:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417763; cv=pass; b=incxahwpuyS/crmRPnHPf6L3BXfznc6VDlPMx++fXpA/VrZUOlMvfaP/78GpglqKeehqPmgonfbzLdCYowHUYMUD4HNuXYr2wfsro09P1Cdr3a8ewCGJvkFnNpzg90/qukcAm0BNOxl6HKcqy+k6arslP3MhYPqSfvG3RjaP0NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417763; c=relaxed/simple;
	bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOd054Yg7SoEJVlG+8MA9DCWeUBrVBb6Hqh6qQGZdJ8W6HlepivYSCk5HWgH3MDJfMVKuNQPwV4zwxUuxl46PNlrgyU9QhgMBpHvK77mLnB4QOqwuV+FZTAN0BuU5XvnulYU7Agvk0Jv3y1qI0yGgHf3oUTJ3tUfqPhspzLO2p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkjwnYb5; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2cb19ddda43so250266eec.3
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Apr 2026 12:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417758; cv=none;
        d=google.com; s=arc-20240605;
        b=YJl6cQp3FVM1LA4cuzgIf82yCVFAvrI4MehdNMXAKOs71qgyUJKPfRdJxFVyY+/UmQ
         l1aqvWX7BsSEN28+M58QG5IsMOsdWtTxlCf9v4zfoo8v8VB7ovXCQfEa9+wS7Ijej91C
         Gyd+eaVSGjTgJlm23bdmEld++gHsEdG590aWyfAwsWKwUQut9IPDbCMOYxr8pFYATaNX
         UIgwhWK6ygKxBzMY5sBiegjm2YySMenXP8pvf6siu5VwNCfPuqCkDSG9jIjsoC8u+tOB
         ZUl/VuV+VleYp61BMYatuOlfAhK2EmN0pbbKPFIS40Z5Od6GwpHrh/R4V9QIklsEEQjk
         GLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        fh=8hqyknLRSRl36nGleOjRSj03WpTakIMYxJoYY9Y923o=;
        b=MhayGpZZRO95rglYExcbU2J5L5vB/Beyew/QtE6KWPkUhVGWtQhWSo1U/SpmcX0wIJ
         1PrRIE/EmVcmn84vquOt3zpiDhe+ZAEndnN9Vd5cCNKrmJDUUMHXmHQXHAuDu3qT168Z
         McddI3ItiUhwzC3wadOCXoxFlnX65HEmfoG8Xt7asFm0Zx/Jqd/UIreYKs7fxzGQ8W+Z
         Go9ZnVxGfTvI6cTXrLsfao0Yry2P16Qp4t5h9UMzFFLB+dY0nBkNn3BbH56TwtvO2xTY
         rv2hRHcBX7CAiYV2b0AjtSzKOcjlWzd1UWT0GP4tiemRDg/vlQXJDaQlMeon2BN2nPQK
         DScQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417758; x=1776022558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=dkjwnYb5y4irn3yDwTic9/zkksmlrGlrcEaDqFrgrrBW2e5KW968xLIRMImwXpMYQR
         ecd1jPK97TvMf6XLAIWhx//UcshQ+msJ11OhHDADc70LU0IvyPC4EIhswfxfuUEFj7qI
         hWDiTqqbU8wBneTz9NyHY1zo75vOqRbvAE/x7Of1tht2oUpm13uX0Oscy9CumKxtRD/9
         u/o04DvH05qA169PQZzzB8juPZXRVgfukM9JTCUj9f2+wlsXYVP7ceiu/B6ANv6bW1tU
         KzL0BCX4ELXxYzoT7TXNvopypQdjHof5W6W3JgDpUBUqBwpEhhcENd/OGF2CaddI+TWR
         HrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417758; x=1776022558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=V6WBvsf9wdds3CjvBiWB0g7pKC7v2XLd9IkqgTC8L2x6y9G/2AXbVtavoZlpuMmcm6
         2kBrc3gpXYTA5DCNy5jwUcCRxN7yprCC+Q6jBu1/hdu0QNu1UiVUYHlnx00K+cgAKAsw
         oJURsaZO+C3ItLALpfC80jzoKJeznDfjxvTGTlQZgQZOdQP5aeE2Y1zDOgC0zMZOB81W
         GqzdON1ol6270g596GkgQ/VEfN28wMbb4EIjgEayrM5RVQjuaQOt2tr5R+Ep1jtxbucA
         GgpPMoDW1P+bJOdhXKHzkCMZkeoRjYskHGTjLPjhzfnrAnBOA6ZjtKAh/K75IkvQdAuR
         pvzA==
X-Forwarded-Encrypted: i=1; AJvYcCV8w3eo2kCqjn1zyZSsCn2r6QveMau0oEG+GOAQTGq8qGx3/nDbMc01Zt/JsliFaI8xYGZU4M/Vmdu1Ri0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOtQ614cVFzJ4awABHhnfK6d0jMHU5jXyepHwHoWhQsrfsHRkt
	I5zhungVzXD/c4GNN6zhze94CtJHht9S/HEcnNUSUd5evrR+vDOZg3tP6C5Y66zYNYHDwdeujtH
	P/bVaZQaj/duG9l70auFmTYjJKaQBPDM=
X-Gm-Gg: AeBDieu15hyQneZp3zrNB4TJwEZHe9tzcK1ejYcY0DeTv/jXcHz0rBkRWfN5TZ42rPg
	4J73u9l1XgLTsmz3jenIA8TNav8zWB/hXxS+aWDD2TGHJWWcrMBvd3fplWMYMbjwJcMKVaDQ25Y
	Zl9zAXR8rERk16yvfDl67M+8Nu6hDwQ+14jVPqMJD265UIUAa5pdVrrmAXut/6NLgU+QsJ0yhFT
	GZ9vmh2BXUpMtglLB+q5Nloa2oRFOEWn9ud0CLkFHSu0Qz7XmTIHLJC0lAfhYa69d5KjTQAfl54
	tdb1QwKzWp+MwyAbToweoLiq/mJAlVpkMzfF2wOeX+06JAJvbSmupsmn+KAESSizo+kTmlI0JPF
	XW8s1K58of20TWOVBykjTNGI=
X-Received: by 2002:a05:7300:dc88:b0:2c6:7f49:a862 with SMTP id
 5a478bee46e88-2cbf9afb2abmr2166610eec.2.1775417758303; Sun, 05 Apr 2026
 12:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4>
In-Reply-To: <177508434465.73816.4492182082440539007.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:35:45 +0200
X-Gm-Features: AQROBzAMmQ2fYtLyUeAFSvUDsVE_iEOg6GKNUQ48f6LlPWNoSXcMUKGWx0A_W0I
Message-ID: <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12644-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3FD139F7B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 1:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> RUST_LIB_SRC is also mentioned in the nix section, do you know if it is
> still needed there?

Yeah, that would be nice to know.

I tried on my own, and it does seem still required (at least with
those packages mentioned in the example). But perhaps a Nix user knows
of a better way to do it, anyway.

So I kept it.

By the way, I think it would be nice to have a "standard",
well-maintained `shell.nix` (or a flake or whatever is best nowadays)
in the kernel tree somewhere, i.e. one that is known to work, that
covers most tooling used in the kernel, etc.

Cheers,
Miguel

