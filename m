Return-Path: <linux-kbuild+bounces-4038-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0355D998DBA
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 18:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93B20B331E0
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 15:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7043A1CDA05;
	Thu, 10 Oct 2024 15:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gLfg+uGL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C4D1CCB2A
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 15:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728575599; cv=none; b=FC9muUndOIWnX3LU9qwzFzTukbDpbZpUVh5ce2LYTjdc3ZVQgUzZPtryKv5pjAQ0ac/Dfs2jvU5I1sUvalHJpcAGdOn8wMcuAKjd1rrlZNk2HLn2WF/r7WJZ1gzc6EuL+sNM8+oA3VWUPDFw+6hcODi9tMgWUPemw/WRP3wgtjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728575599; c=relaxed/simple;
	bh=OEKgT5FaXcrpIO0R1OJJHf0yvgx7y1d7mR06I8IroIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cp0YUvcjcdDq7QkQIkwWeTKC+n3XwE+9krRNdhyWnN/xwdfFA/TxC5iLriga41y2A7x8TeuvWeGayTJ1/fJOPjXX1SJ78qRfSoeQleRm2QLwD36MAnAFRnuhBenlAR3sSDq2ODZX1lzkvFQUfuCLN4P2+kl7zfYd/qvcPyEwlVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gLfg+uGL; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-45fb0ebb1d0so257241cf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 08:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728575597; x=1729180397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRF7QTAhluph4t1u2jY3lQtQT6pq0IqnJy/G2sC0qKY=;
        b=gLfg+uGL9nnJXg3JX0x9h1w/z1xRq5/GKSna+PmYzrHn7KIHLxUgvUALoqM9YJ5NgF
         SDDt09uxrVVKZ6pBH8mLnC7SwqqaM0D1CinL785Ip6NAmoh2zocSvhuv6909SrLfBDvA
         laxdhU9ZKUdahT66MQIQPBhLvvV9heCvHg+zZ+jx+65FbE6kjAIKik1cWKFEWKsCqvcd
         F0hEp/spjigQSK9wMJ+SW6s5UH0EE5Zb0Haa4DQXCdvSvYE2uwro9Hwd2dkfudo7BR1Q
         HVpxPysO+/nkdQfmTwwarGpL/uTBVtenAab5dadGeU++cYr/dkk41dbbPw+3animKJGs
         87DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728575597; x=1729180397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRF7QTAhluph4t1u2jY3lQtQT6pq0IqnJy/G2sC0qKY=;
        b=u7v8+N9Jzo9E0xRmLwDlQcbJpWvcDVEASIuAdBNZvzB9yFLSYKx5ibUApF6vpO8kym
         6choz4vmRmOrOjXHYxLs20C5rk34DCyqib7u/x9tvxkhbN6OfC4GowS6Mm9ICchfqxAR
         MeKXsOdBizGgnCAezJGs6drI7+QUiRZqwBTLQXy9PZc1XjZ9mbCTJVsazCfNcaI08OfB
         bTQEN6j8IiU6hTxqx1XWhmmAbbnPl51GWPSSCN//X/Mn4oV59a1tdNq7nNV3mcUt4mma
         sbFCBYPT7N5AXh1byo3RGZiw2sEog17QKedKprj0pl5pW0IH4tZXlb0RM8mZ0pIbrS1E
         dETQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNbvlq75ITQX6pPXg9rGWw2rqrXCTaogO2/Ex2Oys8TJVPlUTgaJqHHDbhnpkPvrhQWNtaf6sTgBUpLEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpOMcXSJzCQsos7SGHP/m0oHUT+Fvp4D0TtCmzdlblCKF5/Cw6
	YiXoiEwyIuW0E/JbWvY6bCCq4D3W27UKgrdZYDc16yeAl2qCmEUhsDjBo5SdATXwvXNaahh6weC
	2pwiskBXHuj7YfHQ326GjxbvtDQz2fOP0tfqz
X-Google-Smtp-Source: AGHT+IFQAlD/kyDgC4ga4+ipIjureI+CBWbmGopaPOHkfvMa2Tw2xU4vZqdtGy3/S6U22tdGXqVetrx15+hx10NVr30=
X-Received: by 2002:a05:622a:450d:b0:45f:9b3:c7d4 with SMTP id
 d75a77b69052e-46040329dc4mr4203261cf.6.1728575596483; Thu, 10 Oct 2024
 08:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <42aa307d7ffae1851b4a8787f5c276dd0b3beece.1728543368.git.linux@leemhuis.info>
 <b32f1e42-d775-4538-ba36-9e9b906a34e3@leemhuis.info> <CA+icZUUgwJWY=PWO5fQPZbUc-q=LkdHXVe4+g-LnXmQfCA3N7Q@mail.gmail.com>
 <CA+icZUX9hrwFXA-6KVT+yZ=-NqyPB=LOKKWSf77-xb32totgHA@mail.gmail.com> <a5b3c47e-5f0f-4c0f-8ad9-4fb34d150548@leemhuis.info>
In-Reply-To: <a5b3c47e-5f0f-4c0f-8ad9-4fb34d150548@leemhuis.info>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 10 Oct 2024 08:52:37 -0700
Message-ID: <CABCJKudayCsPuowkUW7_JV_2HPNp5tf_py6jjDe6Ld7oMai9jg@mail.gmail.com>
Subject: Re: [RFC PATCH v1] module: sign with sha512 by default to avoid build errors
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: sedat.dilek@gmail.com, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	linux-modules@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 10, 2024 at 1:57=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.i=
nfo> wrote:
>
> On 10.10.24 10:42, Sedat Dilek wrote:
> > On Thu, Oct 10, 2024 at 10:29=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail=
.com> wrote:
> >> On Thu, Oct 10, 2024 at 10:19=E2=80=AFAM Thorsten Leemhuis <linux@leem=
huis.info> wrote:
> >>> On 10.10.24 09:00, Thorsten Leemhuis wrote:
> >>
> >> That was wrong in the original code which you moved:
> >>
> >> +config MODULE_SIG_SHA384
> >> +       bool "SHA-384"
> >> +       select CRYPTO_SHA512 <--- SHA*384*
> >
> > Thorsten, please fix it!
>
> That looks intentional to me -- and CRYPTO_SHA384 from a quick look does
> not even exist.

It is intentional. SHA-384 is just truncated SHA-512 with different
initial hash values. The same with SHA-224/256.

> But that's not at all my area of expertise, so I would not want to touch
> it anyway.
>
> Ciao, Thorsten
>
> P.S.: Vegard Nossum mentioned in the fediverse that I could also solve
> the problem the patch is about by adding "default MODULE_SIG_SHA512" to
> the "choice" section; haven't tried that, but that sounds like a better
> solution. Will likely give it a try, unless someone brings up unwanted
> side effects this might cause.

Yes, that would be a much better way to change the default. Overall,
moving away from SHA-1 seems like a good idea and SHA-512 feels like a
reasonable choice. Luis, do you see any issues with changing the
default here?

Sami

