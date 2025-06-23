Return-Path: <linux-kbuild+bounces-7617-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F299AE40BE
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 14:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D13603AD7DF
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 12:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E2F24A067;
	Mon, 23 Jun 2025 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMnUmRp7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52790248F7C;
	Mon, 23 Jun 2025 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750682239; cv=none; b=SHgR660rNVQx5kzf3RZS1OwQotaPk5dOt9RauRyM3xTFNh537gMFUEX3ZDBWMDC8LtM+zioYH5yZhraYx1XG2liDIvdYmIppjr/Qmx0on76oMaNOBzIGvqBsulwD5LNXZu6omsYyv+4q3PfqYYl9cwKNE/LMGVBIsEso8xh3wBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750682239; c=relaxed/simple;
	bh=6djygWjjisSGtthFe/KFX8iwdEpK803K6qgoaBiMTBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJDT10t1qMWvIisLgHzkTW2GCah4XZrVaRMOSP9XpyX9U9cK6flHCjDZ9vXaTsi5bwOZn49b3JiIqfgAOqcLsijASRutVaqMFynPp0LHGU7QjDdO4cnXPy5bP+Jfi4NV5ma/Rfkh0zewFe464bGOlNc95/vJNOH/8wfcaHx3sEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMnUmRp7; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b26fabda6d9so772669a12.1;
        Mon, 23 Jun 2025 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750682237; x=1751287037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6djygWjjisSGtthFe/KFX8iwdEpK803K6qgoaBiMTBQ=;
        b=OMnUmRp7elb7qhH5crJ/bib2o0kS0gpIDjhWPl5ts8raFemRHG5ZBeTrVlNopX3Fd+
         dRlR/j1BrPPwBUCRW6KdCuVJh7F3gLvJGQr0IJ4thBRK+k/KKtksmUw3r5Mg5LCuXJ56
         f3Q21OJU6AHCBCQ5fZFxgg150WZSDdcx4LtPbOtMaw7TPiQvOycGC4MxFx42wIf7IBU3
         Ji8kM9aJIlTwaXWyzFrNfzzKmwyCOfa7wbZqdPJxPCJeMzG5N7zeW7P14jWLpjMbZgB6
         Rs6/c6osJkuJI0pdij1v3kmidBkE+e6hZDTOLgnGJEZjTIHrJsW8eyOSYghQVZlYd0ps
         UWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682237; x=1751287037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6djygWjjisSGtthFe/KFX8iwdEpK803K6qgoaBiMTBQ=;
        b=vUORCchyEvskN92s0hWZi1aZWz2kiKiCnwTEAAEv7d/QujMyknAZkSaPOZXtH5rges
         OinZtE8zZS36c6q05zYeBcgXM+j9/jyEy1RdcCdHWXfJ3c/ehoLSQatbJmZ25ls0Br1A
         Vr7rE4CRQhPE3VRggAbxAmAyblOBw6hK5FTWbt4gDgVx60JwHgfLwVrPyKXlXQ471r3X
         iUp1Xh9PdfGRSxulI6Lb2Bu0+3N7UTeIQGFviqafJoKP5dANJiLN8Za+RRcsZxRDvUsq
         2U/ob5EemgvkVKeO3AMerinesCQvwP95hZEH6TXGoVOQc01fv7a5AKOr3JWhxzLe3pvr
         6IPg==
X-Forwarded-Encrypted: i=1; AJvYcCU+eD5iqIjMT0lmIVEOFQmQIb+1qB6dbyBCmcWA43UxgGay/RzunzRKZwNlCPks621zbYd6UN1SNudBVRvqFT4=@vger.kernel.org, AJvYcCUe/F1TpmOe4Z3nEcpMICoBMUSYU8jeVLlsfZSLwyMP08d9/OA+/yj5SxSBLR+lFwQ6IJ35g6oCLj2ftA/x@vger.kernel.org, AJvYcCVLDy87ucDC6G7y2yKyQ3C9AhmcDgnPtGPlQVb0ePl3i8IUc5S9rCfc+sCJxnR+qqTFk+y+DI3r68bOzR4=@vger.kernel.org, AJvYcCX3OZsphVQbJmLf5XXO902AhdpbIOMvHq0dE+jQMomWFGw/cbG2sM/S/LH+u93J7yfSMUVbPRv9UjL+PP72Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzav3xluMr4TkUMDwf+E5SXBqD1Ot1qD01CHtgSw5YxenGWGs/T
	BJbOqiy2qgzl7PmLY10Dmmu0X4tyepg3ppAgPPArEV1maNh+zO0136g5NmQWiFioEDRi1saM9jW
	sSleQGb4MFVVHFzepDdX5cZHMKmz35f4erriFLZlHxQ==
X-Gm-Gg: ASbGnctfNiKrXzm5gd2ROXBV/wMq17qheARdwaVDGj2B94wDQwSPZ/sSnt687jQzgG3
	3N4XA1V4E2dTt5fKamXl7mf1ZM0EbfsRWRX/94yikT4LcdFVqOYxa3Ehb5Q4za9pBQ8RU+Nozcr
	vWWga2h5Z5xXRVHIJWBIS8+NinF4pDQPLJXW7ejQXgn6yLPueguTEr3g==
X-Google-Smtp-Source: AGHT+IHj4Vc3q5Tm73gXKkrqpOdUoFXibUWEB+aaKFTc2msTk+p2ncYTBtc78U549+h3Sla50NrSjaTYFBnaq75wZA8=
X-Received: by 2002:a17:90b:5828:b0:311:488:f506 with SMTP id
 98e67ed59e1d1-3159d8dfcfemr6489570a91.6.1750682237514; Mon, 23 Jun 2025
 05:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org> <COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid>
 <DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org>
 <smOfUo2mEmQu-lykKKMiNOUWq2ze6p_CoEEpgGE0dtAnoJDGEpvQMkP1q-n13MiUxLK1xAiM-4QLsivPrG57sg==@protonmail.internalid>
 <DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org> <DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org>
In-Reply-To: <DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Jun 2025 14:37:05 +0200
X-Gm-Features: Ac12FXzd4fB_ylukQug0_-S4aWsl7Va8G7w5RrcYN_9qD3AkvAN8eEjNhJmevGI
Message-ID: <CANiq72nV3QzpRZTyDTv7Qx-c83jeayUY3nnvhpbtOYXf47EgJA@mail.gmail.com>
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
To: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Trevor Gross <tmgross@umich.edu>, Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 1:48=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> Another way would be to use a `Once`-like type (does that exist on the C
> side?) so a type that can be initialized once and then never changes.

There are `DO_ONCE{,_SLEEPABLE,_LITE}`.

Cheers,
Miguel

