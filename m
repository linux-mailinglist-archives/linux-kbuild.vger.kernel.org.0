Return-Path: <linux-kbuild+bounces-3220-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3CB95F92E
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Aug 2024 20:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ADA2283BE9
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Aug 2024 18:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1671990CD;
	Mon, 26 Aug 2024 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xrTdxsMZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B475881AB4
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Aug 2024 18:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724698108; cv=none; b=G7ld42HesbiaQyPs1mCIykgDtqvpuHwKkqo5oykapIvJfKwnEOuGAJBD92ZQgrhMUtkMoNzp9/OKiMcRWoLsTCUkMtRGOBcu/uMbL7aA44A0vu83l7jaeJH3o2LZhnoMYxe0yR8HqU6BcQw0Q1Z+7qcdyMoe3VMvGVsDNv7uFgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724698108; c=relaxed/simple;
	bh=4KHZDbHVvybJrrJRf2shJpi55zrBot//rPnU6diq1ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTcTGMJHKXfwU5y9laQcCm25N1/OyaeWKhwXAUdz9dhtH9ryPpkJ2eFjGqyjsemmzkUubMlOX01vEagU/jzOff6eBeafcTYtO/kqRZz7x0Ok3G/sluE0StJGyJfKGEZQEM/i0oIF7AD4fQNofFFXWrQ/aY31+pTVqnbGaicVCGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xrTdxsMZ; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-45029af1408so46931cf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Aug 2024 11:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724698103; x=1725302903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxRNBk+sXtrzsGJLBtG2+5zrhZWxSczLlI1FbuSfc9s=;
        b=xrTdxsMZ/ZoWTn8P16GU5E4J1mHm0VP4YeofyKM2u9vaRNVYB7q9y7YOYo3MZ+GV7q
         O9lymsCe6g3z7mtLoPmCODjXQOrGxRSyoF7lHXdlvSbFcebdfKtt2GmHABJbkVE5fKtr
         dCDh2zF7DcUrWjcHZJo5bwNJGYont2PfBVu2YpMqlGGNwZm4giJizv35p5cTsaMdRZRL
         FzAGXbHxpArambyRMV+83qFv69fmAyRNYRjGmYtTYhABSSXEFDnjoQ+9/hKx8LlNGmxC
         QMgJjdOVuUVHQl00nZK/LBgfyxRRShY2Dii7x7fMwN3Rhtg7CAmIOgG/acESZyRtF7PD
         vb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724698103; x=1725302903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxRNBk+sXtrzsGJLBtG2+5zrhZWxSczLlI1FbuSfc9s=;
        b=VJWldk1hP/NgMHVZk695YF9mW4RHa/mOaOJmBrRExw75ldN/v2KnjpuDA1WJxyOXBl
         b14m26DHNfo30rFt1VsoihkimKp6MCDsEIFEsmyaGHDPgkncq9iNyUTcyG7T/iZQC4Po
         UG+xF06AqaTZPMV0vPobYvCqgmLqvuJzyeJnubxiwgtYkrqgj64iheOSjPBmnp4s+EVW
         7s8jdWljAFoOvlp3Js7bKTket0jBLe2eXpecv4nyEHEbTN8HxeiySW0udhLbES4j2Ot5
         +V1l5+GIM3nkbQOMybJwlCP3VwB6teppNtcYEo5hDREp9I88FWCXvk1E+PL/CpqojqoH
         fhlA==
X-Forwarded-Encrypted: i=1; AJvYcCW4zH1Q/JOSMcwz3/U2Gep9KpvhrZQSVfD4nwRaGWyAbwwBosXjRf5R0zD3GCxvq1vTb9iQeFu9hWABD0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD6gwaz9UV1yFnhisLEyHwSLPYnoTx9+88wYKrFdihlAV6zO8e
	8NxqyVEFlyrDcb7yu8ubc4u2f8LoKRZZMZaqGdQztLPN+G+YklM3fw+v4eqca4N3/snF151WC+F
	HvDSwNVMbC7CuLD/Hf0wnC8guZG19VA459N7v
X-Google-Smtp-Source: AGHT+IGkpKvYNDu7BE8rDmRjRl0GYKrGuST0mK1D3Ze+fn0oUWdVXS11q+PYcRrRvwRXWWrWWCo3LPcNpB2zFsfmlAc=
X-Received: by 2002:a05:622a:130b:b0:447:d7fd:63f with SMTP id
 d75a77b69052e-45661e2b315mr247951cf.19.1724698103340; Mon, 26 Aug 2024
 11:48:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com> <71505c05-b651-4740-b14a-a53084a16a61@suse.com>
In-Reply-To: <71505c05-b651-4740-b14a-a53084a16a61@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 26 Aug 2024 11:47:44 -0700
Message-ID: <CABCJKufveknkc_ribOBamC_MXRGounFkYBeRkKhppPSHijxtZg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Mon, Aug 26, 2024 at 10:42=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> w=
rote:
>
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > +static int parse_options(int argc, const char **argv)
> > +{
> > +     for (int i =3D 1; i < argc; i++) {
> > +             bool flag =3D false;
> > +
> > +             for (int j =3D 0; j < ARRAY_SIZE(options); j++) {
> > +                     if (strcmp(argv[i], options[j].arg))
> > +                             continue;
> > +
> > +                     *options[j].flag =3D true;
> > +
> > +                     if (options[j].param) {
> > +                             if (++i >=3D argc) {
> > +                                     error("%s needs an argument",
> > +                                           options[j].arg);
> > +                                     return -1;
> > +                             }
> > +
> > +                             *options[j].param =3D argv[i];
> > +                     }
> > +
> > +                     flag =3D true;
> > +                     break;
> > +             }
> > +
> > +             if (!flag)
> > +                     object_files[object_count++] =3D argv[i];
>
> I would rather add a check that this doesn't produce an out-of-bounds
> access.

True, this could overflow object_files with a sufficient number of
arguments. I'll add a check.

> > [...]
> > +int main(int argc, const char **argv)
> > +{
> > +     unsigned int n;
> > +
> > +     if (parse_options(argc, argv) < 0)
> > +             return usage();
> > +
> > +     for (n =3D 0; n < object_count; n++) {
> > +             Dwfl *dwfl;
> > +             int fd;
> > +
> > +             fd =3D open(object_files[n], O_RDONLY);
> > +             if (fd =3D=3D -1) {
> > +                     error("open failed for '%s': %s", object_files[n]=
,
> > +                           strerror(errno));
> > +                     return -1;
> > +             }
> > +
> > +             dwfl =3D dwfl_begin(&callbacks);
> > +             if (!dwfl) {
> > +                     error("dwfl_begin failed for '%s': %s", object_fi=
les[n],
> > +                           dwarf_errmsg(-1));
> > +                     return -1;
> > +             }
> > +
> > +             if (!dwfl_report_offline(dwfl, object_files[n], object_fi=
les[n],
> > +                                      fd)) {
> > +                     error("dwfl_report_offline failed for '%s': %s",
> > +                           object_files[n], dwarf_errmsg(-1));
> > +                     return -1;
> > +             }
> > +
> > +             dwfl_report_end(dwfl, NULL, NULL);
> > +
> > +             if (dwfl_getmodules(dwfl, &process_modules, NULL, 0)) {
> > +                     error("dwfl_getmodules failed for '%s'",
> > +                           object_files[n]);
> > +                     return -1;
> > +             }
>
> I see that libdwfl has also directly function dwfl_nextcu(). Would it
> make sense to use it to simplify the code?

How do you propose using the function? This loop goes through multiple
input files, should we need them, and we iterate through all the CUs
in process_modules.

> > +
> > +             dwfl_end(dwfl);
> > +             close(fd);
>
> Isn't fd consumed by dwfl_report_offline() on success? I'm seeing EBADF
> from this close() call.

Good catch! I'll drop this in v3.

Sami

