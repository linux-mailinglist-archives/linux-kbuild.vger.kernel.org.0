Return-Path: <linux-kbuild+bounces-4543-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2689C0515
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 12:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0A062831AC
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 11:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14ED620EA26;
	Thu,  7 Nov 2024 11:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C9xY9pxT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E40F20E32F;
	Thu,  7 Nov 2024 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730980713; cv=none; b=gMXSK1TY52FGRtC2kUV1yLH0Bt4Ulc0DlgSgW2xVm35Z92MrjcuLrdk3ZvoVcvVY255HeyP3/8+SEoTegSLb69tm7dCKF4v3jw8n5YAE0LZ+l5B9A5Ke/LBp2V08WfUeUt2BuTZ6ZS7/3bePdSlGpZfTxvgoZEVxEOeelQWsnGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730980713; c=relaxed/simple;
	bh=nw1lnGh2RJPeIABl3agOJj4u7ZuKcu4/NGAN2/31ULw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+tx8mv2zVAogQ9RYpyuBIW5uvR4aMiaIVTy5GUoobcCQC2N8q2QwNM0TTlnCXHfCzGEkX2PbtnM8eChabu3+ZGxpjXsiXAlipbNS7GPDXJ40mWT+8qSTeu0RT8uM6feOanSwxk42AA4Ro4DtDGitF1Sq8FQFOAVaFgJpvV//6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=C9xY9pxT; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QeeeJ+pTNi3ecp0eZcHHlz3Esi2ELCMxUu1oqF99Rqk=; b=C9xY9pxTKJgMCVVwf7E9CW+MK3
	8H71J0TmHgrjcQTh3Eyf4HNUIwb1Bi8uBQnxLwB/hkSw6VeqvEdCTe2cnQn3QaL9obN7W0YQVZOYs
	XyW2HB2Fp2yz0wfdAP+JnYpU+RFgRLLH8fbj12L1uOhAUtaMcpIpXX3tzkaISiuJ1SMGZKHYYBtN7
	TJ9O8qlslbDbR1v0CrZN6Mai7PNpojbEdaFtPBtfbMYmaxsQP7MXnWHDmG8jBT8/mcxl6zWjVOKC/
	rVhFoMik8zKSuwU/x4ac8EKmzaiJ3DGzRRquRL4i4ra3m+ai57b9V61Oqq04f+a4+BMgWECn1x5jt
	4c4mTeTA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t919Y-0000000C803-0Tpx;
	Thu, 07 Nov 2024 11:58:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 364CB3006AB; Thu,  7 Nov 2024 12:58:19 +0100 (CET)
Date: Thu, 7 Nov 2024 12:58:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org,
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [RFC] module: Strict per-modname namespaces
Message-ID: <20241107115819.GA38786@noisy.programming.kicks-ass.net>
References: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
 <CAK7LNAQ-wMTOaCuBab-JOfz4ggefNiEBmiKCUpuFncTqS0P3xQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ-wMTOaCuBab-JOfz4ggefNiEBmiKCUpuFncTqS0P3xQ@mail.gmail.com>

On Thu, Nov 07, 2024 at 04:55:46PM +0900, Masahiro Yamada wrote:
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 107393a8c48a..d1de3044ee03 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1553,8 +1553,19 @@ static void mod_set_crcs(struct module *mod)
> >         free(buf);
> >  }
> >
> > +static const char *mod_basename(const char *modname)
> > +{
> > +       const char *basename = strrchr(modname, '/');
> > +       if (basename)
> > +               basename++;
> > +       else
> > +               basename = modname;
> > +       return basename;
> > +}
> > +
> >  static void read_symbols(const char *modname)
> >  {
> > +       char module_namespace[MODULE_NAME_LEN + 8];
> >         const char *symname;
> >         char *version;
> >         char *license;
> > @@ -1586,12 +1597,16 @@ static void read_symbols(const char *modname)
> >                         license = get_next_modinfo(&info, "license", license);
> >                 }
> >
> > -               namespace = get_modinfo(&info, "import_ns");
> > -               while (namespace) {
> > +               for (namespace = get_modinfo(&info, "import_ns"); namespace;
> > +                    namespace = get_next_modinfo(&info, "import_ns", namespace)) {
> 
> The conversion from while() to for() is an unrelated change.
> Split it to a separate patch if you want to change it.

Yeah, at some point I had a break or continue in there I think, it
didn't live. If you like I can keep it a split it out.

> > +                       if (strstarts(namespace, "MODULE_"))
> > +                               error("importing implicit module namespace: %s\n", namespace);
> > +
> >                         add_namespace(&mod->imported_namespaces, namespace);
> > -                       namespace = get_next_modinfo(&info, "import_ns",
> > -                                                    namespace);
> >                 }
> > +               snprintf(module_namespace, sizeof(module_namespace), "MODULE_%s",
> > +                        mod_basename(mod->name));

.. here ..

> > +               add_namespace(&mod->imported_namespaces, module_namespace);
> >
> >                 if (extra_warn && !get_modinfo(&info, "description"))
> >                         warn("missing MODULE_DESCRIPTION() in %s\n", modname);
> > @@ -1700,11 +1715,7 @@ static void check_exports(struct module *mod)
> >                 s->crc_valid = exp->crc_valid;
> >                 s->crc = exp->crc;
> >
> > -               basename = strrchr(mod->name, '/');
> > -               if (basename)
> > -                       basename++;
> > -               else
> > -                       basename = mod->name;
> > +               basename = mod_basename(mod->name);
> 
> This is an unrelated change.

Hardly unrelated, I added a second usage above. So you're saying I
should've just copy pasted the whole thing and then it would've been
fine?

> So, it should be split into a separate prerequisite patch,
> something like, "modpost: introduce mod_basename() helper"

Well, I can...

Anyway, let me see about doing that whole ',' parsing thing people seem
to want.

