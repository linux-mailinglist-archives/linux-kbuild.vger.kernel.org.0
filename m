Return-Path: <linux-kbuild+bounces-3320-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32218968BB3
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 18:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA8F61F22BE3
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 16:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C001A3049;
	Mon,  2 Sep 2024 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBINCg2U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF0B1A3041;
	Mon,  2 Sep 2024 16:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725293586; cv=none; b=NOakPXjyJ52OPdF1zFWVdarFpzJf/6ikB9S24+t0rFYQXSyWAwBzACh9zcQEB+3+0bdWR4jDQOkzRgDKZ5KjG0wTuKTNKwmKcTV6vXxomwpRDZQBuXZ+1w5lXmr1bB1Msp3l00NQuAA/SXM62oDGiVljelO2Sxp2BGg/PzPZQVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725293586; c=relaxed/simple;
	bh=PkLOxCkNizd+ybNJD8OQZ9G2dup++KSG86ccKsgVnhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egt9b3ZskcagVPTHVIxJfJoUosABdM2ydhb7oLgId740DU/KTd6q00jJJP9qLHO6L0DlCJbksKr87EG5S3jjTsPqe2mgw6iilc/dF6KI4Y6lSjvtrMjc9VaXEKrLdlSxFhaYwxeMkdCetTsYXHhALEOnD7dGR99M7itsTSYRBIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBINCg2U; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-205557f9699so2692415ad.2;
        Mon, 02 Sep 2024 09:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725293584; x=1725898384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr9ly3s1ev80tCY18uK4VK3dnJNlLG79YNi6DNJ7ijE=;
        b=VBINCg2UPoD6T6Unhr6Raylsh+5zG4ufRf2QG1IT4QTA7mLkGzhcGtpYsOOtOCNPjy
         ywDxs9njSvoW5uWz6D9J74//gU+hCi+cpQ7NOiEIXZBUWiyrawqTU7sXUZCCBm4tHH03
         FY6t+/lW/QY2Kl++9kesSyEs6kDlqxqiLNhEv/TfFWdelszf+T+wJmFJvVvlpkon4CX0
         qNBaOcJvZtScxR72HET8u2gdp3Q3Dn8PlFmwAI9iVzCkpeh5gdktMmOXfZ7H8H/PB6OP
         FVmDsYsONBENrPOHfBTm3L/ETZIXDCQ+Nj5yHVWjKxMlwrR7Vog6qmI6GAha3yj75OfU
         +jSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725293584; x=1725898384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yr9ly3s1ev80tCY18uK4VK3dnJNlLG79YNi6DNJ7ijE=;
        b=HNdrCKBnO8hIZA59XQC1sFHu+CZbITtfxXKTymfIvKpFWRXC2R+qHmKgSoofnfxkM/
         wUZkR6F2oMb6ly6L09hfXCZy0lXKQrhlcDP38GEJhyRldueDHkdgddre+nnz738kba7v
         ESGQd5VFwngaJnDQyGo9GO2zvWmSIGtb55tAA3t/XGwG9xz9Oy265EbxgFYvciutDxPg
         pm7SkX773K7+vh3Z6LSqgBM2KgVyGvE+DZ8sTBpoK2iv580hGKj8Qrj7CGQhTuVvAbkN
         iaYuY9Vj/l3SPS+FWWp0a7kOXP53HofCW06R1446CmrenusE18+kbLiZtlWFdNfus/Jk
         89Gw==
X-Forwarded-Encrypted: i=1; AJvYcCW2zBqgQdKCee0dEvBsuCx+TPKj2CJRS7JVJxb/nS1twDFkX++dBPnbVqL7kZfGwJpbyLYgA8ax/XI2ZcYx@vger.kernel.org, AJvYcCXFbOyHJzJQRMmSN7SLNXVxofYIrrjriuCnORIF1VOyZcS8ZFaNcv6D0wUGBI+h0r3/rhE10yFtJdhRBQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTa/oTX15BI6FVvMsk7x3AQGERCg4gNqStCP27FbI6whGHrmHr
	6aSTFoUOYUuAcvndsfws6nG3EZigk7JdSSvAQFU6nSVkGKKdmLKTTCnh+7UmWjRzeNK75Kc+caH
	MDCkD/LdWHO3fQcc3se66P8bws0E=
X-Google-Smtp-Source: AGHT+IG5OODsTRRpis5CT4TCncYMiLySZFpswVaAEd9Nxpgz+7EyIi7uVv+lu/Q8Iy7I+QK6/OvqoMocd9JvdSQvX4s=
X-Received: by 2002:a17:902:f2c9:b0:205:5410:8f54 with SMTP id
 d9443c01a7336-20554108f91mr38988105ad.11.1725293584259; Mon, 02 Sep 2024
 09:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902160828.1092891-1-ojeda@kernel.org>
In-Reply-To: <20240902160828.1092891-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Sep 2024 18:12:52 +0200
Message-ID: <CANiq72kV90EjHGitEVO4GQFYtQJZ_3-1rkXJnOwez7u7Ph+Z3g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: pahole-version: improve overall checking and
 error messages
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 6:09=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> +if ! command -v "$@" >/dev/null; then
> +       echo >&2 "***"
> +       echo >&2 "*** pahole '$@' could not be found. pahole will not be =
used."
> +       echo >&2 "***"
> +       exit 1
> +fi

We may not want to print a warning in this case if this case/setup is
too common, though.

Cheers,
Miguel

