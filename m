Return-Path: <linux-kbuild+bounces-10612-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6C8D30AC0
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 12:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29E8030194D0
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 11:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D8D32C92B;
	Fri, 16 Jan 2026 11:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftQZ+rdP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB57379981
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2026 11:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563945; cv=pass; b=CBcmbKIwV/jk6GZnHfGszf7leryvdJ1qBQIwc/BVaFxQ0wWwZP7PW0cY2Rb2J3PAEpnUG+j+z9M2ZI1/2/rsVkYugvRvHUvQOOLVvko15WeJeDS76wZH2gv0hoLyndjbb5IZodnd6zwEpRQ2HVxaUiIUnNB2EgPUziH9uX7KG0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563945; c=relaxed/simple;
	bh=pTJDT6aBf5f2SgUDw2Y1HK0c40HgHOOicrIIXRU7nrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsNF9vPTkwqeo2nQE+CNlEmsw+ELlf0VaTYnGYRzoGFDDi5wURTmHKc+TMemm6IrUqiy36l2Ltlcsi3J6fvfiuqxMUZlmpCnBI7bL0StWAWhNdolY9cWzYMxIa90eoJGQ83zCORpxk15C/Xy38iNrVhCBtK4dpagM6uYHWJUXcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftQZ+rdP; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12336c0ae91so136090c88.2
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jan 2026 03:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768563942; cv=none;
        d=google.com; s=arc-20240605;
        b=WKljZrv+8MGOrXN/CaSl4CgbCUkvCuCO75SvuZhqILG4cKic6KQL5eVU2zPg4YHwyt
         uksgQFHMggAcY9k8Lr3UiTq1/s7yZygUclf6dhFhLONDrnKkF4gRxN22MLmLSveRmcsL
         fMBlklL5ku1Nn6TZA3fBpU3Wt3XifVmT2U48xswKlb2qu0vwJmjGozJhgZ3AUmhMwSTH
         /ghLcQD/u7TkZtZIjUT3TlnU70/qxa0J5aOj3Qnxfk9Gu81kSLiZ3EUn05TDqpr3xoGI
         lLjeu0KifDxO/GlGM9o6DV+evTe3qMWgSPunLVUCOaHJBrHdUg5uDa11cGhnqtQ1eUJJ
         zbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pTJDT6aBf5f2SgUDw2Y1HK0c40HgHOOicrIIXRU7nrc=;
        fh=P1HdXIm2WXqOxtxz8Mqtn2YMa9Q9JJZQW4XIE5I4Nj0=;
        b=Ltn1KjCcx761FuOU4CfiHTFVtiEicJFG0cA6wvpznzaGnAiVBFkXTGMzA2sVvyzzda
         cMRs2Iuh63OJjM0aQzBlTE8RglCA/rCLD8iy9Xu/GmfXYoOYPcEGPCaNBMCEW5E+VJnS
         XszTe4KDO2bcXqenvjGe8J5XpgdFxtsrgIfB+2Bmf9K/3cUXhpmRZDHuV7YzCDrvyAn1
         GbrRGSlv/0x/sYhousMC1o1yAFf75D1hC7vXrTw+mdSVzrCrsI3uCrHdHcm/TNzCkTmD
         N81gix+/TKIsxDRr5cT6xTlNcIHO0FoCG22Fw+k0kgF0gcnxPk1gn5OCP/B+b8E8Bbtj
         Nd6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768563942; x=1769168742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTJDT6aBf5f2SgUDw2Y1HK0c40HgHOOicrIIXRU7nrc=;
        b=ftQZ+rdPu+KCwNQNzIyzTo88PpBHmfAC497r1c9HDY+90I1SYN90jHPgDcvxEQYd8T
         2iFlvRY1omULGhpQHu+c6DZeN3WxPcyCQp5FqS6j+Jol6nFoegbd7bpFVacrYhRj5Xog
         yyJKH+VyyF6ovifq8ELpEE83G5uxss5nQ1kPGJ84qtHVBruoDZhqbiOOv2mM425VOZ+Q
         +piydc2O1PTkiFYCmyrtzpELAMbNA+Cg0JWM8/NSkjNQP7cXrYuEN1CuEorDkBVs8/A7
         ISokM8eqO5WKn4+n73YwBCDu+Gbes/5y9yoEJtqf33s00vrKSQCmmNHKKSY2K1y2dULC
         Mgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768563942; x=1769168742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTJDT6aBf5f2SgUDw2Y1HK0c40HgHOOicrIIXRU7nrc=;
        b=UYDXLpJue82oUPCihB2DGpwY+4o7ZpgQarfe6e/xT0O0aSnCFGhzynFag+VWjmltqw
         6xUGO049YZoAAIhF3s6RyevW+bjePOavAyT+GBLsW1lSk/t5AR0rQNNLv2aZ7IjBSgCQ
         pUPA86PjhzfzkCoZ2GOX73PMo6Cc+gbqVB6O85V7okkHPHyQzY6dABSCNEaB1lWxggn4
         BRjXld3bGJQzaVmQjhQAbRVqKulJhF60+2Z7ISaELJQZ7e/jh6HiTJ6xdGVR0EwI+NpX
         br8UX6u5C2GOloW1xOvcJL4bCpLUNCI+lBk4P743Shge86J5ww1tG6YT9N7jpG68N5qm
         RJAw==
X-Forwarded-Encrypted: i=1; AJvYcCVSHKk07VaX1w7PPw2VnAjwnPR2c7kvRV8+T+GWNO1luUmnHta8fgFroobY0x9N7lO5eQrJLa+cr5PXf6M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7rLHgLna1XSbtsK1XYrAt3ZrE0NJVhZIFEWs+oOOn7UWny0qn
	Ge6bs92TsjsynodLFqXNDf1lUWzuvUDndj4YG5EPbjfuycDcIVslPH85ZyciMKXwWs/nZyALL2T
	DLW01zq/2CLmnhn+zacbnZ/pBuKiPEcQ=
X-Gm-Gg: AY/fxX7TKaQIuPwFWtQoQWqTjGA+FO3V4A6z78IMKOmdLfFeFnVKp0u8iw0CtoVE5qd
	IhyxyRFc5o8EZDzbx4coZUFZsYh4hk6yupVqrlIjtCW3OPKBiNWhphloXhuFIOqsIMqGnuW/R/+
	h80pCk7MrxBhdeUumbJeJnWpGBWEezfevn2sq/8hZubuEI/ZZZE6Efit549mtx5r/hvju8gklWn
	0YHNc+08RprvJsJYwZjjCWyPGuhdUioxAMF2Y6/8xlFYDlfCDIy3Rt7GKHq1rUaMErpuA/DmJEA
	JuTzQf2XnYWX2S6bVy4OrNmbnVP28V3AL9NUT1u1CrvusE1QFyFhiby1PElIa71i97SIA2DbI+1
	2psQyoSSnDVRw
X-Received: by 2002:a05:7300:c88:b0:2ab:ca55:8942 with SMTP id
 5a478bee46e88-2b6b41158fdmr1228451eec.9.1768563942070; Fri, 16 Jan 2026
 03:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115183832.46595-1-ojeda@kernel.org> <20260116050046.GA1452322@ax162>
In-Reply-To: <20260116050046.GA1452322@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Jan 2026 12:45:29 +0100
X-Gm-Features: AZwV_QhV6K-qT3UXCGRcMn9P3-NDEJ2FPKUMtsDwU-sRw8aTakC0RUNjVyAPQqo
Message-ID: <CANiq72n71Pm84F3CvFebdXumHp5xfe9+DPberh_64v_8do1qDg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: give `--config-path` to `rustfmt` in `.rsi` target
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 6:00=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> I assume you will take this via the Rust tree?

Yeah, either way is fine, but I can put it in `rust-fixes` since I
will send a PR in a few days.

Thanks!

Cheers,
Miguel

