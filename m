Return-Path: <linux-kbuild+bounces-3274-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585439633EE
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 23:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B69DBB2375F
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 21:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFDB1AD3F9;
	Wed, 28 Aug 2024 21:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wDRWooRX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A67115B137
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 21:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724880782; cv=none; b=GGzt25I0MkpDtxZMod2TbGFOvpGJikXYa6zuGygrVQmq55QQ/gPkopW80e5zDqZVPc+05AsNCnQK3eUro866thiJdngBg831/y7iULtW6oZ4a3iCQCzTTOfLWano0b9bCbgFbSdz0GMWToyohvZi7wuylmKNPtOddB0FMk1cuEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724880782; c=relaxed/simple;
	bh=cEpCS+awESzibz2fx1rBVxzmh/G9/OK1eGkd1D1LRF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8EfUucNZeJ4g/atHYXtRFCwVtwfOP11jVwoegYFu0w63/DvDswEsmdfv/D4BVYWcva9SnIvaiy5+HxOWUO+XsXcoB22qx/TGWDxhxRIi1I1YywwvH8hPfIBAJ7Hi+YX2ApyF8TVvz8xfqKidZ5MrzVp88qgCIjZlcnDLS8hxbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wDRWooRX; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-201fed75b38so24615ad.1
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 14:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724880779; x=1725485579; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6OiNe2YeQCUna2f4UjRdeOC+WErdfdXGa82/r6tUnVw=;
        b=wDRWooRXfR4puGYCZll52GXUhb38BKO9LpLdLgtDfRlLUaTpg+uHT00gYpMkGnKc0g
         BMfbF7+kIhUGkJoKFiPfJtX2tzCHP2jAlCBt9Gfrp5/643Ez3Qg9VDZ2B1aoQUpZdCvl
         AeJMhWKUgeo98hid76CWbpnlckir78xJKXKuI/Y3QsJUDae5kFCHANVnOJEbtA+MoeoZ
         hgz2eXG6e93P+/bfXDRniuVDXo/mCDv3dOUSDYgICmS9Yu+fr15/Bx2vwiU9TEL1bu2m
         bsKpqhz53dQ4NwPjSsJRhAZJNKwxCVviacI2eb2F01HPL3BCn2JCztv4VOrWLvYIkHsg
         hKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724880779; x=1725485579;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OiNe2YeQCUna2f4UjRdeOC+WErdfdXGa82/r6tUnVw=;
        b=gzMcMRy1laIfUjmjRa8rhDz1Xk+r2LYdjsiWgMK266vWHhAxL9byjzhGNVDWo50Y6m
         AR5aBqwtk75rnhUde7PtnVkAQUPWkENhe6hO3TqcJia8nXSSSYom5DRZRg1sH50Zujct
         mR2a/JkVqc27+tzN5L6dojtxekPLmhG77o98TZNgjoxJ2SB1zHsGfc/UTsfT6i91GSIe
         qYA0eELxE22M1cVZoyunQk8vx62ROmxcWx2a7nWYfJMHppXYEXR1HYLtn8VnxxU7MPmZ
         gAjOhZNOsvnprLPs5Yq+DM6uJ9zSeLcqsgb1Utmh1c6U1sL2zq6g28lB661c0nE+ibmO
         EHSw==
X-Forwarded-Encrypted: i=1; AJvYcCXi8FyU7X6NMz8twZnfjEzlW7Kzik50GoKBEXOhZfhePxJ0i9LrxXeTb6oXloNnkBFTz1AY3Tx2vLPmVRM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/zyQW8chjHnrPZ4+JGNC4E7332GHtTKXOO5fnIhPapD7LRgGw
	/BHke5jGmu01hDo7inz+7Ls5G1BPD3gb9JS1+Ua6SmVSKlKnd5SniPzoHnq1Ew==
X-Google-Smtp-Source: AGHT+IHHf+VlJrFFBJgPYVRNtck/f/imxXiwO9YAgJOrmaeUNIYbTt/FhYzSs4jbx7giAS/mraakLQ==
X-Received: by 2002:a17:902:e5ca:b0:200:8e1e:9940 with SMTP id d9443c01a7336-20510d58e83mr210625ad.23.1724880778385;
        Wed, 28 Aug 2024 14:32:58 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dbf41sm102647885ad.134.2024.08.28.14.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 14:32:57 -0700 (PDT)
Date: Wed, 28 Aug 2024 21:32:51 +0000
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
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
Message-ID: <20240828213251.GB2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com>
 <CAK7LNATKWnkdmxvPBaBLYThLk0Voh7UVh5V4_eKHs9g-40qUTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATKWnkdmxvPBaBLYThLk0Voh7UVh5V4_eKHs9g-40qUTQ@mail.gmail.com>

Hi Masahiro,

On Thu, Aug 29, 2024 at 02:45:03AM +0900, Masahiro Yamada wrote:
> On Fri, Aug 16, 2024 at 2:39 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> > +static int usage(void)
> > +{
> > +       error("usage: gendwarfksyms [options] elf-object-file ...");
> 
> 
> 
> Description for each option, please.

Sure, will add.

> > +static int parse_options(int argc, const char **argv)
> 
> 
> 
> Why not getopt_long()?

Good point, I'll switch to getopt.

> > +int main(int argc, const char **argv)
> > +{
> > +       unsigned int n;
> > +
> > +       if (parse_options(argc, argv) < 0)
> > +               return usage();
> > +
> > +       for (n = 0; n < object_count; n++) {
> 
> 
> When does  "object_count >= 2" happen ?

Right now it doesn't, but if we want to support LTO, we'll need to also
process the temporary object files we build for stand-alone assembly to
find types for the symbols exported there.

> > +extern int process_module(Dwfl_Module *mod, Dwarf *dbg, Dwarf_Die *cudie);
> 
> 
> No 'extern' for function declarations.

Ack, I'll drop these. Thanks for the review!

Sami

