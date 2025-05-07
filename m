Return-Path: <linux-kbuild+bounces-7022-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC72AAEEDC
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 00:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 322C51BA7C9E
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 22:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1FA291146;
	Wed,  7 May 2025 22:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sugdTwtC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC77193062
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 22:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658749; cv=none; b=XiY5nOQulAImDRM4BUDIjuusgigFFg/tI+90yXg1nwXaEYur+11GL6tIsGxmpl/qxNPmvCu4aONXkSNUry4+X8kj5ePJAAqLY7yGdWyhOUWM4NnskdyiseTrZFzshT3Y5oggQJulR8Px9UZbyeSCmWYFapWBX3BCvMj0t6pPXR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658749; c=relaxed/simple;
	bh=4qznrIQd9heCD85pUFAjDNFme4Ro9HM6p9y3geLJfT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEQzPRqtThfLMZGD3mPmD1KSw+p1ravywgbGpvfHaViG3IX0AblY5Cl7vnNuR8UdWpIVKHmas6Ktttl2JKFzyGfrhznMrd64zbgi2QGisXFOrP6v/nLEG4sLul15XSPGw/p1qLMwb4OBH0NQPOs2SOJM+vO4WDllVVbfVURH1zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sugdTwtC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fab85c582fso4479a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 07 May 2025 15:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746658746; x=1747263546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qznrIQd9heCD85pUFAjDNFme4Ro9HM6p9y3geLJfT8=;
        b=sugdTwtCFYvGjVFdweSDSrE0kpQ09IL+Jip36nQTXjB0TdLKr/tZJIlN7jt8ukf2DY
         w5SO2yNGzy7Q4cVWIoqnlLt/nAwaSgVFsKijS2XZ8MFyTKTZvkSX5hm9qVvpmzJ6l38q
         tVrBuI13GAl/r2paHdv1EaskwPtkqV5GUMdcoitnQ7YNAH0+V/u9R7akJQwpV+dRHlwE
         qpeStstt3hwxwfGfcjBu+yAEOlRFfmAUcKDLNJzA06JHw7OGCF6GQM4Eyn+9huMvoL7d
         Ff1Va48luWQMwjfeOJJfDP3eCLkFedKXU72xcNr4DvlzCKuPO5PFfbcgbzl0gvlLFEWT
         aQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746658746; x=1747263546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qznrIQd9heCD85pUFAjDNFme4Ro9HM6p9y3geLJfT8=;
        b=fMGChUX8eSd9Fu6g4g7dMAtdsO2zvRVoBNFWCNr0xkFZO0qHZIiOvsyAOmzsry+t3Q
         nIFO+WrYGPgafifkTYH3VP0uS1/rpGF27O7qY3btiwufr6PAXWxrY2609+TxzA01j/iP
         uexqTy37kqeoZlyo10yMCgxRPVCB1/kBw9nTkmWweNiyAsDBM+qajSkGfoKsgt3E5lNI
         tl+ODldDEs1CdrpX12IfFuZcTHvdyjCcAY/pwYQKO4nzgNTQ+1KWGEn2Hv3dPxzn1M20
         f0aBPz9qoFTvxeEY2Y1xV+lHsderrjn/VkQCd9pZPbOJjqRB6ZtRrx+GPXM6UAaMEo30
         XjEg==
X-Forwarded-Encrypted: i=1; AJvYcCVZLxBu/R1GTNy+Y/aBVFljUJ8V/FxXlwClauge0P6VvWhE51VJM5kztQQvMcBpRoIX2fLOLIGDdJIm6js=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF1sTjHJE1lDkYhV7KIkqq9DnwbBy9y2KUt17058VRxNFbVaOI
	C3RAUMTvcpHTupwezZaFT3wjdBhgA/Wf7Aht48zTR06nX5mVNP6h5ux6Ip4f6Y3vK/7GNGFq4j9
	hcipSIsE+4OH0vNh9g5hiNhJgz0Fy4ryaLkzk
X-Gm-Gg: ASbGnctw2ruejuZ/HVuKn0hcAL+4wCpJ7Kc4lqbHj9pmpUfvZ4Qh4SqU1vcyM4Xg9y1
	tNoZa5aRoVkmFPqzslmVNhwF1NiMyggxLivtDvXJen281CxqemS/wKL8UGkz+y8Ij+X3xSgE2HT
	odGZB0/boCWPxTcwqPJI0ylxc7sAoPGl7ES9G3X/ZtFJSae/NA9A==
X-Google-Smtp-Source: AGHT+IG5UM76A79+IbRtPyKJbFmyzXpMUKCWJ9hqDVsiMGpyhjFhDGSChhn6i9wySXk6B9CqU0BGHm8UgBUgVRm87Zg=
X-Received: by 2002:a05:6402:1a27:b0:5fb:ee5d:b5a2 with SMTP id
 4fb4d7f45d1cf-5fc6d4d522dmr15802a12.3.1746658746142; Wed, 07 May 2025
 15:59:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505212401.3379699-6-samitolvanen@google.com>
 <20250505212401.3379699-10-samitolvanen@google.com> <CAK7LNAS0Obe-ye1ba06EfZ+mgmc6ter+xMa+mKCw6aRM14L35Q@mail.gmail.com>
In-Reply-To: <CAK7LNAS0Obe-ye1ba06EfZ+mgmc6ter+xMa+mKCw6aRM14L35Q@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 7 May 2025 22:58:28 +0000
X-Gm-Features: ATxdqUH75sjGKquTsxZiAfvNfjaDztMLHXgmmKdCV2-0xtfGeIwBKHIdY6DuK4s
Message-ID: <CABCJKueJ2+TpUyJsLOuy3_Q324iOhmKm50vf4UvRot51Hbi87A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] Documentation/kbuild: Add new gendwarfksyms kABI rules
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, May 7, 2025 at 12:28=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Hmm, renumbering is annoying.
>
> Maybe, better to stop managing section numbers?
>
> For example, see this commit
> 1a4c1c9df72ec266f94631edc59f9f2a9dc5aa8c

Agreed, that looks much better. I'll send v3 that drops the section numbers=
.

Sami

