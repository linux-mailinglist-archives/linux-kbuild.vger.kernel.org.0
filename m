Return-Path: <linux-kbuild+bounces-3867-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD72298C77B
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 23:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D5CD282A67
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 21:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E2E1CB32B;
	Tue,  1 Oct 2024 21:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FvE7kiBX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4441CDA0D
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Oct 2024 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727817687; cv=none; b=Nc6o6yZcg6vY5SVD//LQ2HkrKRRlf4RFuPk7jZ5OfLVJjiQG9kk3KxSjK/CPP/GhDMqGHnUkhhhzEu9xWu8uHf15QHsdfc1c6ws+COaX8UrHQ9uUS87g285e2N92EdxkrtbsK77dkaX0g/+A2YPxkJocyagzgrtrJ5reAs2A6Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727817687; c=relaxed/simple;
	bh=EQjfFUP6V15WHbsMfHvl8IITEfL2R5znZ0//S7cqib4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLUKQO/khr/8tJFJUNz9R2MWO/Hn7wi0NVR4GhTetiVXPJQ4e/4sNz9xQ/abTBhzIq9W9LPhECBPUi0EDusQTEAVPAIsfYi3drWKnXTmCbOXP2MiCg49QX6FMC109IrqVreCZCFeVrzE2xpsFhA1sA4F23jth/xSOcjNuvpgqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FvE7kiBX; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-536552fcc07so3168e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Oct 2024 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727817683; x=1728422483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoWrsU7z+qdIIFDpkMHhN4PhrREusH4jkiAl/mJtNdI=;
        b=FvE7kiBX8ZtLZa9UpwtJfNIQrFOiEzSoWeAXMqTVzC/H2VHvnD/MOVgjvO0BPoNHTZ
         DLgqN3x8qnWckY/gGPNv/Bwd2FK9OnqD3D6YIAbjWpTofZuNBgtspGjf7KejVXlwlYMo
         39cx8VrQsjE7n66dpjeoz+zzskC2COm2H5qxWCBxWj/IJf2S2qOom62uSkEQgh1CmEK4
         ks7Q6jEiCTLjB5NGmyjK5mhTnyS7+epwMCv8pMAbYhqCYY8B0H1yzi/lhA2XG5bP/deA
         i2BIFNwkzAwJO7O4KRmSVFAVvNG+TPQ4k3xCujBD4hFgvH58NuF8NJEQPhSRooSCldoV
         l6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727817683; x=1728422483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoWrsU7z+qdIIFDpkMHhN4PhrREusH4jkiAl/mJtNdI=;
        b=PUsS3atQk5mgpPCOeI2criMnduC2TfG5Kf7I1x7g9JJHT98BUTkpR8p/DunIgk3YQl
         v++rBWmBa3DihF+P6soR05Nd0ycAJX/0uXNe14EcNy/yWKEvd1v29kF1jkYH48vWgbVA
         1yURJJJ/EO+NYLpMHOBtwF0sFSRgtagaxpXrpnRXmCwpIYPOTCAWdzD2G3+2JoeDt2r9
         H1H9qpu8ZHYYjMyUHGF/fHPtQQ4vBrUO0ZmtP2O8/DW36CUbjFbUycUg+lyKZhsDT/IN
         JJZfCnOEdrKq+83FFq9Us+GezDCh/zaAgWR8+mBzcYvDp9OcngK9Hz/Gx0M60fCsVAPT
         wWlg==
X-Forwarded-Encrypted: i=1; AJvYcCUS6w2VTB5KPlHHbEkBe67GgWuVg8OT5SWgilMJCp0PhZfWLpBkOC3bcOWgDeMI6WQtdMxMESzGi1l/HIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCSCVkz/rqH2mOFzgmQxKpRImsoNECnw5uEd1CTIVILRIsF9Ul
	OFAbspC9HyI88Ib1xLSkftLsVmVbsu2iI+LRku1U3xDlxqVja9L5opCqGMH6KlQPHW39DqOGaii
	9T9fNU8jQyFSlhIplMb8DNdWiKAdwxy40G2Jv
X-Google-Smtp-Source: AGHT+IGgP22tnj35LCYM0fX1Dz0p+NCTjOYdsvD+bPVZjH0BMXExjm00WWuhd0WmAK7axQvJ/g54h5N5+4LKt45smrY=
X-Received: by 2002:a05:6512:239c:b0:539:9ff9:5cbe with SMTP id
 2adb3069b0e04-539a0f0695cmr152225e87.4.1727817683249; Tue, 01 Oct 2024
 14:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
 <20240923181846.549877-32-samitolvanen@google.com> <f0eee8a9-766a-463c-bc36-676e49efe950@suse.com>
In-Reply-To: <f0eee8a9-766a-463c-bc36-676e49efe950@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Oct 2024 21:20:41 +0000
Message-ID: <CABCJKudn0WcOAg89ouTQoEHQC5n90SdetxHYG7GvQWmWo6WQ5A@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] gendwarfksyms: Expand structure types
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

On Tue, Oct 1, 2024 at 2:16=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 9/23/24 20:18, Sami Tolvanen wrote:
> > +static void process_variant_type(struct state *state, struct die *cach=
e,
> > +                              Dwarf_Die *die)
> > +{
> > +     process_list_comma(state, cache);
> > +     process(cache, "variant {");
> > +     process_linebreak(cache, 1);
> > +     check(process_die_container(state, cache, die, process_type,
> > +                                 match_member_type));
> > +     process_linebreak(cache, -1);
> > +     process(cache, "}");
> > +}
> > +
> > +static void process_variant_part_type(struct state *state, struct die =
*cache,
> > +                                   Dwarf_Die *die)
> > +{
> > +     process_list_comma(state, cache);
> > +     process(cache, "variant_part {");
> > +     process_linebreak(cache, 1);
> > +     check(process_die_container(state, cache, die, process_type,
> > +                                 match_variant_type));
> > +     process_linebreak(cache, -1);
> > +     process(cache, "}");
> > +}
>
> For variant types, should the tool worry also about DW_AT_discr and
> DW_AT_discr_value?

Hmm, I initially thought they were not necessary, but looking at the
rustc DWARF output a bit more closely, it might actually be a good
idea to include this information. I'll add these both, although since
DW_AT_discr just points to a member DIE, it's probably enough to just
process all child DIEs for the variant_part instead of limiting
ourselves to variants only.

> > +static void process_unspecified_type(struct state *state, struct die *=
cache,
> > +                                  Dwarf_Die *die)
> > +{
> > +     /*
> > +      * These can be emitted for stand-elone assembly code, which mean=
s we
> > +      * might run into them in vmlinux.o.
> > +      */
>
> Nit: stand-elone -> stand-alone.

Oops, I'll fix this too. Thanks!

Sami

