Return-Path: <linux-kbuild+bounces-3276-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB196342E
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 23:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77EE9B23A53
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 21:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3751AE031;
	Wed, 28 Aug 2024 21:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u430U86/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01CB1AD9F7
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 21:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724882205; cv=none; b=AsH0Yrdg9FRxyeqOO2KI8FtbweMOvDf7WxOkCzc/3HeNXj4xUCHyTQGpKEXxEDMiYBW+/X8d176KvqGosK3zEkSZQbsQNl9BdTr1NcNesBbGi13VQI9oeShboJHUMIddQSwOc6R6447KecqeeTQHOKOfd2q2s3iwXKP3j6fR9fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724882205; c=relaxed/simple;
	bh=PID4ATgIcRdlwJUDpahwj8UfLb1Vr51kkg4K6Y9E+zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOQ+9hbtqjDmCaNs2c378qTryEOqfvplAC68ys1XeNfisYVZWulmyJ5SJ6SZT7klnSjgAAeQZiv2FnTQcKqETryqV/DTnerBcmsGpXzpz0ebxpGQg9n9gKt57N67L76BIG5t+2rNwGg2OStLPWvbMtgtMHjBmZjb7KZwPdV8h74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u430U86/; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-201fed75b38so28235ad.1
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 14:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724882202; x=1725487002; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oMJtTqWHyENpXYFshc0NGQIcxCOjJlWKHxL6Pc51Vp8=;
        b=u430U86/w41hIGFRxUWn2jOegZ4k8oU+D01A/WfKA6xHYh9biKU3pjpECPVqChTXeT
         lh1cnSqRaX7byzuwdtxDxnKpWIFMUVmmbh5u9Yg526AnskSHunCa/RGuYq9iJWUz3pyt
         bIOeiHXLS8Rq0JbG6TGfrkGVAyzbdE6FrqNS4qWL48M0godsDp1BxyNi3MpIyLolXEl0
         u7d7wNZ6DfO5QMytEPTUFLEkpfzwtHrwO4+Z9a1+CyWpEhw55v+xc/8v3Zh7t8SbEaKF
         T7+QXDzVJG+xqTsoqnKdHmizcldii+sbnNFkCqNHUr2aG5F3WVawzyR60yEF4xgyfGE3
         jQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882202; x=1725487002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMJtTqWHyENpXYFshc0NGQIcxCOjJlWKHxL6Pc51Vp8=;
        b=L7yFwcvg26F+w46Hh3enIvun+hXbtZ1fBoYU+fwcgxvKVt6aiZVwX4CJuFAXa3gGZA
         qdDDQmdWbvmDaxqfXPomw+jeIczhK2FrXQS3JrJ2cDp53JjUW0/B65Iv3AIJpZJYLzuK
         ut7oXMh+eIkf4XidqZPH4Wycms0d14ldtPiM6PGYNixUB2BEm8nFuuYRfj6LvN0OSaSS
         e7a9lwiEcjztYhx3nquO0/AhU6QUU6PuWze4A+ZHk7wzjq8md2+LQ0F9nKYnd2WAnsnF
         r0I/5G0vK/fX46R8jLtPjj7DOOXDw+jO0IKaSPKBTtPtcEjLL6vyLqNMrZ0UuMfKozpo
         GGQA==
X-Forwarded-Encrypted: i=1; AJvYcCXVzJUtj2E1PqJWGEj5ZRPf+bk/SekqIQvN2rGPpfy7UR3dTKMEjRsowKBfA+BBQVKqt1sJPzhDyU81Qb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH3QbXST2cW8S8L75BYK9iAaNF9D/U7jj6BFGne/xjNVmYW4bj
	a+bsDJDTnNai7fAAuQ3YFuqdAev6D82F8c5sciBUmbqcNFUGtqo4PbXAOSZU2A==
X-Google-Smtp-Source: AGHT+IFWsFfpSmAomvEtt5G6mILaLDEaIo62yZwexT1w7z/fqh1GYiNgxkqAWApkzmvRxk0nVu7qtg==
X-Received: by 2002:a17:903:187:b0:1f7:1c96:d2e8 with SMTP id d9443c01a7336-2050d1999a0mr965815ad.10.1724882201781;
        Wed, 28 Aug 2024 14:56:41 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445f9602sm2484968a91.14.2024.08.28.14.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 14:56:40 -0700 (PDT)
Date: Wed, 28 Aug 2024 21:56:37 +0000
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
Subject: Re: [PATCH v2 03/19] gendwarfksyms: Add address matching
Message-ID: <20240828215637.GD2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-24-samitolvanen@google.com>
 <CAK7LNASAzsgmkWGOU7WWuBMmzG4vPRDQLjyW4sW+q46QZT=vnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASAzsgmkWGOU7WWuBMmzG4vPRDQLjyW4sW+q46QZT=vnQ@mail.gmail.com>

On Thu, Aug 29, 2024 at 03:22:25AM +0900, Masahiro Yamada wrote:
> On Fri, Aug 16, 2024 at 2:39 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >  int symbol_read_exports(FILE *file)
> > @@ -57,13 +93,14 @@ int symbol_read_exports(FILE *file)
> >                 if (is_exported(name))
> >                         continue; /* Ignore duplicates */
> >
> > -               sym = malloc(sizeof(struct symbol));
> > +               sym = calloc(1, sizeof(struct symbol));
> 
> 
> 
> I am tired of noise changes when reviewing this patch set.
> 
> 
> 2/19 added malloc(), which is immediately replaced with calloc() by 3/19.

This was changed to calloc because the structure now has a new field
that should be zero-initialized, but I do agree, this could have
just been a calloc from the beginning. I'll change this in the next
version.

I did try to make sure there wouldn't be too much churn in the series,
but clearly I've missed a few places. Hopefully there's nothing
equally egregious in the later patches!

Sami

