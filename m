Return-Path: <linux-kbuild+bounces-7137-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C41ABA88F
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 08:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA2DC4A5703
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 06:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19AA1B0F1E;
	Sat, 17 May 2025 06:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+r5A+5k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856FA1B0402;
	Sat, 17 May 2025 06:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747464526; cv=none; b=Wi9w3MtiRzcO5vF4HRSkEXmbVlWIPunWHFPs01SLZ36JDl9GKFk85rLK1dXmSOxHJu3Qucg8adGg8IICjfka6PiUqA1j6VZJiLjNlsq0ehWJwZX/1Wh+6v0rbCYUnkrxru9CT86d3nSMIUgFwmxWDP9vtEbKKY6+Cgr0zXV8ZeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747464526; c=relaxed/simple;
	bh=aLOa1Y1BIjOIRN5PiEFqnYYz97jK143J9No/tB+OW98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jM8G8jj/kFU4QXHbib9uLJzTE4EGRgPr6LTgDKTh2Jw6CcrE5dDqNLC3nL3eBDZNk6jeqGAYxE/1Q3oJ6aS1TkqZ/TXcp01E7rSAUjoKojLaNFaTal35YlgvMTHIlGol4EmsLDLhfJ4ZW//548OmoxK5w/2rzVdDlsrS386wL9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+r5A+5k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03391C4CEF0;
	Sat, 17 May 2025 06:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747464526;
	bh=aLOa1Y1BIjOIRN5PiEFqnYYz97jK143J9No/tB+OW98=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I+r5A+5kmVuR63BVtWKC6uehwsKDlzSm2fIe1r+C7kfqkFg8xG1eIVB6haLV9vLls
	 6qb5Fx1iu9UjY4GAuQIIYXKusPG2QSpZiY5x98pRzVplBa2K4w1f17+OS29aGofbmV
	 m+rad0Dw892Q0F+xUqevorA6qjoI0XG20HVb2Xs9JVN63VxIfpKnnDOvcAy2gCzUOc
	 2vvH7MblNdMOxYflji1K1d/BrUo6UeOhAhad2ohdR/v4vyxL5ZJYYOo2PGmc3uknHa
	 gEJ1UT2ygzWLr04i6CpQIf4ubdPuCh7er5zo+OpTZGakehglJkAKImJS0FPXMDjVGl
	 aXrHQMNEZwj3w==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549b116321aso3088020e87.3;
        Fri, 16 May 2025 23:48:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1WAbUuZIWd7Ys6rAUHvTbG0VZ0PZKD6/AfccGC2Xzz+YLESlObRNEVD1NjpopB4LU0AsHeWZuD6sZ6U8=@vger.kernel.org, AJvYcCWHIQDrLJJYyjwSUUWTAChJwxjCC+7Yuv8kmahXKu+H5PvjS8WP/6VuDqgr2YNcWlE9BvaDnDTA+GGQ+9Fx4Q==@vger.kernel.org, AJvYcCXBPn6E3qPe2Hux97WdWd75M4EqCXogbGULA/vgChdD8ilzH+xKnJ2enK4HNIOOoUSZwV7KTH8AnTU1ETb0@vger.kernel.org
X-Gm-Message-State: AOJu0YzUQsXPs6dQ1RbOPOFkEze7U7dwUvRl9fKVTqD3bPXZrlD3w2I4
	i0Zm7RI0ichZmxTcV1/sqBNyqDihb8RvVko1Sq5FTYNvVd8pwzwHwff1m/MvK1VWxkjpkhpfo6c
	9zYKURORyU72iMA0He2J3pIpjLYoc9Xs=
X-Google-Smtp-Source: AGHT+IG3nj+1xWmyXBbr4RQOBkUesab7q/d22rPuqa4yE+7QLiofsO/xkQ6CddMfu/pSFEO4kYCAK+IjxaH64uvgGtg=
X-Received: by 2002:a05:6512:a92:b0:549:39ca:13fc with SMTP id
 2adb3069b0e04-550e9938627mr1358345e87.49.1747464524723; Fri, 16 May 2025
 23:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502141204.500293812@infradead.org> <49b63a7c-d323-4b13-8a1d-11ec8f0a3152@suse.com>
In-Reply-To: <49b63a7c-d323-4b13-8a1d-11ec8f0a3152@suse.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 17 May 2025 15:48:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNATX3qGFfLASWivOTWVqRAFCcSsgwG4b2yBuXc+0YUfH_Q@mail.gmail.com>
X-Gm-Features: AX0GCFtaK0xZ3kjP6EKrdBjWFKHrUGf2zKNzdWHSCVrDNnhxZ_an07Agj41hMjc
Message-ID: <CAK7LNATX3qGFfLASWivOTWVqRAFCcSsgwG4b2yBuXc+0YUfH_Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] module: Strict per-modname namespaces
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 5:48=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 5/2/25 16:12, Peter Zijlstra wrote:
> > Hi!
> >
> > Implement means for exports to be available to an explicit list of name=
d
> > modules. By explicitly limiting the usage of certain exports, the abuse
> > potential/risk is greatly reduced.
> >
> > Changes since v2:
> >
> >  - switch to "module:" prefix (Masahiro)
> >  - removed some patch noise (Masahiro)
> >  - strstarts() and strlen() usage for prefixes (Masahiro)
> >  - simpler ___EXPORT_SYMBOL() changes (Masahiro)
> >
> > Not making using of glob_match() / fnmatch(); this would result in more
> > complicated code for very little gain.
>
> @Masahiro, please let me know if you're still reviewing the modpost or
> other changes, or the series now looks good to you. I'd like to take it
> for v6.16-rc1.


The first patch was applied to linux-kbuild.

I think I can take it.

Peter did not use the common API for glob matching.
I will check this part.




--=20
Best Regards
Masahiro Yamada

