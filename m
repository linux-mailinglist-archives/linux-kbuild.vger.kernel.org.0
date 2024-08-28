Return-Path: <linux-kbuild+bounces-3279-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 440A29634AF
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 00:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 009DD286649
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 22:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5180E1AD3F2;
	Wed, 28 Aug 2024 22:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qtl0KDNF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2251AC442
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 22:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724884085; cv=none; b=mhYZiA8YCLn+5PzgpsKDp8XOlsyjkQ94s4bOABVHUNVWVwmgfUPzPU6FoQJ+oAksVTTy/sTEJg3dVXhePNvkXJITZ5mAVf1EI7NOQyz0bedMh91u2+oKQW2EHNBYcZ6F1Ty7AOX5hqKbMnbgzFiZ2pVFltlkNCV0glcKsCTPMMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724884085; c=relaxed/simple;
	bh=X+km3MM8Djv4BAoedxYfYSnV7h3AO6W0/QFMSBR+6tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3ChF4p5GXDrizqTOXMFc3eQB4kXeX1LeDd2rahcF+LYPOCkqQjW8LsNWSC/7Vey5IO0o8lNfZ7sSYZFhSPOtm2Woii8v7eu48xqP3VXlHooizLgiBZILr0W04W2C0yVg6vxQJMXs8FWECWmwRJJgLPpXSzDhnFJyWwnDHwUuv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qtl0KDNF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-202018541afso32735ad.1
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 15:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724884083; x=1725488883; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RyvIuJm8YmYnY8dX3OldQiJE1+zDwIi+PDulR5QhNTU=;
        b=Qtl0KDNFau6tda4TQsdUKaVUUNaP4IRDY9DgPE6BgrLHCZSy17nFABDMZgCdSRcD8R
         vXuXRrEbZNl5BRXwr9iuoTmzdf6mSCiJwKittvuZ45g7CGMai9Ix5PUAFWGbDixF1/xd
         mmKnEl8JQNxQXkquVklYWiCfzFJNFIZ8p+0bfENuGhLi2BNYgO0qAKi5jr5yra1uveK4
         o7MuhuPjLUXSvLgxyM8NWl1hD++z89Gw+ohOHuufU7PgsJZmKbw1Ih4IEl4D7dAFgoae
         Ar6JUylJLg7p5CaRVtFp/+5CA1sbraUKp+Wfbb9onVVkdh/i7c5Yo0inppEH1WAt1T3g
         Q/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724884083; x=1725488883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RyvIuJm8YmYnY8dX3OldQiJE1+zDwIi+PDulR5QhNTU=;
        b=DuBQGeogIBgZG8QOmyEn3S3n4N9ROgVlzD8jjLovVRMeqwBpTkJADo6yXgG2ZdTRX4
         gsqFzLHkiEQJsGhnuPZQGf83xKN/eUhSNGjBYJTRpAZXo7rImlu5ur2TMUqjHaNG8INe
         ez5+E+MJnXRW4NzJgAwPgJtoIiy/attAHN0K3nQwFuSX+hMDZdbwQRGb3PItBUP9v2bh
         dNT+J/AkGr/xLUNGRjcqh90AXcqRKgBF/CZCA5x9rQNx+Zq6fFVg4jezPIbQ9vPo14Wn
         JRDmxrPXK6hp8tHI03HpjeNC2U9Si1C4DzqDCwd47bcyB+ac0tTcAyJi9PPxUI/pYd2P
         Sdtw==
X-Forwarded-Encrypted: i=1; AJvYcCWsAIG34g0x7vl1vD+Z+lZgYIdiPxhOkjyr/B3KCw24XyQw/JBuE0UDw+UZax8n5r5ysuCadS6RtCV2x50=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz89PtOLL+adi/lJNbdj1gCmCqfYwHrZUG8d/+Iwa1cY06T4ckX
	CsI31iOUCzniheVWnxykA48gVVKwAHPqswEhNAywgFR/7Q+4rRMdqndsP529fA==
X-Google-Smtp-Source: AGHT+IFXWx05e/+XweIL+R6dsRvJNpSo2hQC1mySqaLDGAhfbYvgJChv9vcvthH548sGd8lARL2kdw==
X-Received: by 2002:a17:903:22c7:b0:1fa:fe30:8fce with SMTP id d9443c01a7336-20510b5500dmr423205ad.23.1724884082803;
        Wed, 28 Aug 2024 15:28:02 -0700 (PDT)
Received: from google.com (83.92.168.34.bc.googleusercontent.com. [34.168.92.83])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d844618f6csm2496536a91.27.2024.08.28.15.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 15:28:02 -0700 (PDT)
Date: Wed, 28 Aug 2024 22:27:59 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 06/19] gendwarfksyms: Add a cache for processed DIEs
Message-ID: <20240828222759.GG2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-27-samitolvanen@google.com>
 <CAK7LNARQncjxxqbjiMHXdAnakpo8QYo-5kYnN=KaD2xDe0uXPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARQncjxxqbjiMHXdAnakpo8QYo-5kYnN=KaD2xDe0uXPA@mail.gmail.com>

On Thu, Aug 29, 2024 at 03:15:02AM +0900, Masahiro Yamada wrote:
> On Fri, Aug 16, 2024 at 2:39 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> > +static int append_item(struct die *cd, struct die_fragment **res)
> > +{
> > +       struct die_fragment *prev;
> > +       struct die_fragment *df;
> > +
> > +       df = malloc(sizeof(struct die_fragment));
> > +       if (!df) {
> > +               error("malloc failed");
> > +               return -1;
> > +       }
> > +
> > +       df->type = EMPTY;
> > +       df->next = NULL;
> > +
> > +       prev = cd->list;
> > +       while (prev && prev->next)
> > +               prev = prev->next;
> 
> 
> 
> So, this entirely traverses the singly-linked list
> every time a new item is appended to the tail.
> 
> 
> In my analysis, this while loop iterates for thousands
> of times in total for emitting each export symbol.
> 
> 
> Why isn't this list_add_tail()?

Good catch, I'll fix this in the next version. Keeping track of the
last element should be sufficient, but I agree, using the existing
list implementation is probably cleaner. Thanks!

Sami

