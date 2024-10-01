Return-Path: <linux-kbuild+bounces-3865-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94F98C6A9
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 22:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 429A12847CC
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 20:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E3D1CEAA2;
	Tue,  1 Oct 2024 20:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rzTnF5cE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638521CDA0D
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Oct 2024 20:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727813934; cv=none; b=T9v67Yqmgz+9ftHgD0eFWmze0Y4sULbdDA99Ds2amiO2xdD/WiZfQSzvZ8TQLDh201TA8Nnh+CgXfLN3V2KxoAufRJgXhGPJHYrMUQKKJmAROv/P0bdl4q3XtFJzjJ7AhWON6oGY50mRDod0tN7LBunV/wztzWLu508jcO7A09Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727813934; c=relaxed/simple;
	bh=RyRRva46Au0EaG06flnXvPQqiLcxe9w3qwxQucSjMPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6Y2PsVBJs63Y+9iXZPhzRb1F/OF5MMtGYwxQr5fxbJ051lnYy306bLHPJPiICzGphSV/TrlirpdM3e3S7YYy4HyVdsM5tAcxCDPDnQ2TVwUtawfjX+KDzIejV3QTBAcYfIZPiIum8oAwb44HhWPVSJLFa53vz85b1MpQMCkytU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rzTnF5cE; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-45b4e638a9aso17321cf.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Oct 2024 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727813932; x=1728418732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/GuuFkapqTR185OUWCoLZGw0BcekQwTFJers3DxjmY=;
        b=rzTnF5cEbvkLP3sY1Oina7JAfndb9xo6iCeNvSZzD/T0fNhc5ecL66L1LeCRf06fn/
         /rkOpdhuX87DWewavvVEowvxAl2bpxLzqz4E1D2yLi0IWMLcbfa5XLd41e5C4ervULd3
         23uOf3mRlaxLNpE8DM+XewZUT0q8U5cU7cJie1izHZM84GUAFA8ybkYfheYlywR0rB26
         rYN/SyaZR8yWdrD0wKZX40hiYKhZU7i0hYEigo4jcFLeOelDeIXZ87w2JMVLSYpCSpr5
         947ywT4jloqMC9W8fMnDdIHeASufDuB5simirHdKygm+fRLjG1K/LKSsTvSvfykHPcb/
         yVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727813932; x=1728418732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/GuuFkapqTR185OUWCoLZGw0BcekQwTFJers3DxjmY=;
        b=N8KuThacZ9fIJtzYPMDnYgEvdAnX+D3Y6kgGXfmSAOtamEbMArdL5rTeK0M6PM70mY
         Yus1t0gIWxz6q3Z9CdR46AO/33es+/mlQHO6iXN7N+hBZrFD4S1uv7Bg0Pge4c8sZcWQ
         W37JQaXO0RxxmUiVvh3JaCn3HYLg1blndlbdcN3WsOUY5J0lGb8gGZpH6mBlIreE4W+k
         eH6lH+j4SPhqOjU8uchO5staxco3/G5+9l4F7zpSC49z5iBCWvp17kWDyJkiBdfJTtpU
         QmVjTSCqBX0C0uPL6WJTo/vXRSeMwaoLNFywjbTtgfKQCNej3laGxcpbFgtD8tUIDk9i
         uczQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+WbyAZ1PMuIAzYryIsPXlOjgxYDKqaYF5k+7TxsdSzqKCOiLNZH22nw6jtiOBIIyk/bMVR2eCOANi61Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9IdmGOIeoMEXMn1aDcwwia+zHzqrO/ziHv1o95Cj/Shr3+Dsi
	owqTLLl0gPKezt6Lg4UQJS1zthjQl0iiZmfPVPPAxdhr7OTlp3GsmSCQg1CLbC+XhwD6YJQMAM3
	wa63ni7chSuLts2u1S+xGwNVkYAyxRjcHXJ34
X-Google-Smtp-Source: AGHT+IGgt6P2UjzCfEsFRuOsqPPi1mqlprj6DD1mDyXiUt6hrKmTWvB7O34383hQFNSzxcqc9hke5vvwb8pZ2vx7XYc=
X-Received: by 2002:a05:622a:8612:b0:453:5b5a:e77c with SMTP id
 d75a77b69052e-45d81709cf4mr770761cf.10.1727813932030; Tue, 01 Oct 2024
 13:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
 <20240923181846.549877-28-samitolvanen@google.com> <a71e018b-1dc6-4427-8f10-399d8a9a5243@suse.com>
In-Reply-To: <a71e018b-1dc6-4427-8f10-399d8a9a5243@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Oct 2024 20:18:15 +0000
Message-ID: <CABCJKuf4G0=XjOkagTBah+u6V7ZxbY9qdGYdqX__45bE0SeN8Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] gendwarfksyms: Add a cache for processed DIEs
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 2:10=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 9/23/24 20:18, Sami Tolvanen wrote:
> > +static void update_fqn(struct die *cache, Dwarf_Die *die)
> > +{
> > +     if (!cache->fqn)
> > +             cache->fqn =3D get_fqn(die) ?: "";
> > +}
>
> When is update_fqn() called with cache->fqn being already non-NULL?

In patch 16, because we need the name before process_fqn() is called,
and if we end up outputting the name after that, cache->fqn is already
non-NULL.

> In general, I find handling of cache->fqn slightly confusing, mostly
> because the member has three states: NULL initially,
> a statically-allocated empty string if the DIE doesn't have a name and
> a dynamically-allocated non-zero-length string otherwise.
>
> I wonder if it would be possible to reduce it to two states: NULL
> initially and when the DIE doesn't have a name, or a regular string.

I also thought about it, but using an empty string to represent an
unnamed DIE and NULL to represent an uninitialized value seemed the
most reasonable option.

> > +static inline const char *die_state_name(enum die_state state)
> > +{
> > +     switch (state) {
> > +     default:
> > +     CASE_CONST_TO_STR(DIE_INCOMPLETE)
> > +     CASE_CONST_TO_STR(DIE_COMPLETE)
> > +     }
>
> Nit: I suggest to move the default case out of the switch statement:
>
>         switch (state) {
>         CASE_CONST_TO_STR(DIE_INCOMPLETE)
>         CASE_CONST_TO_STR(DIE_COMPLETE)
>         }
>         error("unexpected die_state: %d", state);
>
> This way, if someone adds a new value in die_state and forgets to handle
> it in die_state_name(), they get a compiler warning.. or a runtime error
> later.

Sure, I'll change this.

Sami

