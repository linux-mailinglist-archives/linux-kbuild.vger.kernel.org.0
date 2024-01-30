Return-Path: <linux-kbuild+bounces-728-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8432C842F80
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jan 2024 23:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B64A81C21CFE
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jan 2024 22:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFE17D410;
	Tue, 30 Jan 2024 22:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dyPOPKRU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D1A7D403
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 22:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706653169; cv=none; b=fAJVjt3TgkKfMoftODgSykueV+n2QBMsR0wjz+Qw+hTUICQzymNjFsd2v6C//XVIoUQpu+oYnLaPsf7SH1DXgywJ7PXbZxwSwGMbV2kWCQ7/9YgSt0mF6Qeh7Qps2/t8BtUM8T5NX4Y0jfDT7AO+aGlrueSdxuk56cakBtuaDzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706653169; c=relaxed/simple;
	bh=IC3p5zH5zXXM8bR+woCqmXd7yYe1yCTFkea4aKMs4wQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PA50Hj6QX9lKdDxP78/5B0CJtM3iSFupRmSGX7kw/W2mzsukTKHIbtkaEIUbPC0zhFC/ErzyA7HgjQ1f1sMHi0YdJKqBzexO1p5uYQQtLpBb4ec46WhM6E+V+v4+ojjbYKWjS72AZ7xbJGfHgE38xsvql07dF1IDZ5TCISSq9+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dyPOPKRU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d8d08f9454so19555ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 14:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706653167; x=1707257967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vQl8EgXpJK3C8wCH3PL/CVofTbAYU7lTGBdvfNGQY7M=;
        b=dyPOPKRUwf4mAl858V4jYESVWUPy185wBMTJaFf6TVj1QeAkIQ1hN5UORup3mGLzDW
         rc6+mUzX/TIZNHgkrTHHNW9ChIx3X+jQ4bDcG0kMonjcmAEhjsBCg3mvD1N/NoIwuXVq
         3I++X7db05TBqWCfjvpTcJOKw4S437LeTbpQQnpjkngz4Vu2AWVCxVoT+uueU9slFUWZ
         f3K8BWCux3hPhsx3yATvDBKgGk3dl4XK0bbmHjVZSAL5cMTjtNgSj46/iXE+Vo+XDHZ0
         CMhALcXfXM8XDwEE6X47dUxHkCr0tSuJllI/kMmjw9DmJtZ3DuRd+6d3Zkaxdcu5GM3B
         rs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706653167; x=1707257967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQl8EgXpJK3C8wCH3PL/CVofTbAYU7lTGBdvfNGQY7M=;
        b=DncP/TcGsuqjiC4btO9JlYfM1ZnhD3YO3942zbPABQsH0YxKYwxkNw2CHprJT8c62K
         opXbbuyXLeN5dhNumsNqM0q3KcmEsuEwlw5Ls6r84NMTscMybNBxTaXJWKdG7Rdv4a+j
         HvROTJ1KWB1STovh3iTNCSz6L3VBAJvBgR0qRVgCJmbYH5ZGko7SA/q9EPKanop5OxvC
         rQkRLZd+1sdZHkFS9V2D1k4et1EMfjDqwfqTGzAtwFhGf6QHUM0CQ7ZZfwufe5z/DBwn
         fAP0DkzvWc0woKeRqNy5hhL0yVvEjpAF/PSLj81ShVLDdK5segcqSrHdr9bIKS7SEIHj
         J0Dw==
X-Gm-Message-State: AOJu0YytMv+fK5JpFPXKKsTxmefqU/yGNYQKiVrGKub6ZAGEHUiY5ZEI
	BwOW8HnD3fPbcrOcq0qO89rrOU5bIZz7X7yTq1/RaabqHNUSE90WQFLDQgaXlw==
X-Google-Smtp-Source: AGHT+IFwLv+eKGqrkCeOjgMbEoehzCvXoH+cbPDe2PL0I9RdXrlE78Tt/rrzBUHv78ajXUWMaQtqow==
X-Received: by 2002:a17:902:e547:b0:1d8:d225:699d with SMTP id n7-20020a170902e54700b001d8d225699dmr383866plf.16.1706653167019;
        Tue, 30 Jan 2024 14:19:27 -0800 (PST)
Received: from google.com (69.8.247.35.bc.googleusercontent.com. [35.247.8.69])
        by smtp.gmail.com with ESMTPSA id y11-20020a056a00190b00b006da8f6650a2sm8241626pfi.155.2024.01.30.14.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 14:19:26 -0800 (PST)
Date: Tue, 30 Jan 2024 14:19:23 -0800
From: William McVicker <willmcvicker@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	linux-kbuild@vger.kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] checkpatch: allow build files to reference other
 build files
Message-ID: <Zbl165bfizOauIlf@google.com>
References: <20240112221947.1950503-1-willmcvicker@google.com>
 <ZbduU15kw5R42awj@buildd.core.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbduU15kw5R42awj@buildd.core.avm.de>

On 01/29/2024, Nicolas Schier wrote:
> On Fri, Jan 12, 2024 at 02:19:46PM -0800, Will McVicker wrote:
> > Add an exception to the EMBEDDED_FILENAME warning for build files. This
> 
> As far as I can see, your patch fixes only the checkpatch warnings for
> top-level Makefile and Kconfig (and leaving out top-level Kbuild).
> Other build files are not affected, right?

Since $realfile includes the full path, I wasn't able to find a case where this
issue happens outside of the top-level build files. The same goes for Kbuild
files -- the top-level Kbuild file doesn't include other Kbuild files and the
other Kbuild files don't include other Kbuild files within the same directory.
If you prefer to protect against this warning in the future, I can include
Kbuild as well if you want.

Thanks,
Will

> 
> Kind regards,
> Nicolas
> 
> 
> > fixes the below warnings where the Kconfig and Makefile files reference
> > other similarly named build files.
> > 
> >   WARNING:EMBEDDED_FILENAME: It's generally not useful to have the filename in the file
> >   #24: FILE: Kconfig:34:
> >   +source "drivers/willmcvicker/Kconfig"
> > 
> >   WARNING:EMBEDDED_FILENAME: It's generally not useful to have the filename in the file
> >   #36: FILE: Makefile:667:
> >   +	} > Makefile
> > 
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> >  scripts/checkpatch.pl | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > v2:
> > - Unwrap commit message lines
> > - Align and update regex
> > 
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index f8343b34a28b..c2869803e545 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3785,7 +3785,8 @@ sub process {
> >  		}
> >  
> >  # check for embedded filenames
> > -		if ($rawline =~ /^\+.*\b\Q$realfile\E\b/) {
> > +		if ($rawline =~ /^\+.*\b\Q$realfile\E\b/ &&
> > +		    $realfile !~ /(?:Kconfig|Makefile)/) {
> >  			WARN("EMBEDDED_FILENAME",
> >  			     "It's generally not useful to have the filename in the file\n" . $herecurr);
> >  		}
> > 
> > base-commit: 70d201a40823acba23899342d62bc2644051ad2e
> > -- 
> > 2.43.0.275.g3460e3d667-goog
> > 

