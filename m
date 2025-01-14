Return-Path: <linux-kbuild+bounces-5482-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E07A10FDA
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 19:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7A073AE406
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 18:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B91020CCD3;
	Tue, 14 Jan 2025 18:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efJ9j0za"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C241FAC5C;
	Tue, 14 Jan 2025 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736878655; cv=none; b=QfDYcTk9PJC86patzdpwly+1Ea421YGnY+MgBu394rCrV5Du49KBqcOCQHoa/TV+2MNrIFKdrpCnfpO2RNZsYnUXxpOYoFhtYnvWZbVY1kAGbGcqq069f62rFjUhp4kKqehpOuYbwQdaD2MmZG4GEwo44JFOJrNpO+Zw17DfAn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736878655; c=relaxed/simple;
	bh=MytSj4aou//7tB75x2lve09a8LLcqBD1ngjk8hqqleQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XgHqZK3humWywFWRE+G5r8muqIm3yg6dIHTRrvnn/6iyeu4uro4KSGGxEnHGkYQcQa78luZSwYcNObfX9LXtAnO6W9FOv2QnH/VOWTH2BfbZM/oXZB9t9d9hNiR6U3SAa13qAnqY0M0dNNdP1u1QkYFULonfUpCUQuUIUN3gKSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efJ9j0za; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DD9C4CEDD;
	Tue, 14 Jan 2025 18:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736878653;
	bh=MytSj4aou//7tB75x2lve09a8LLcqBD1ngjk8hqqleQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efJ9j0zaVNoFCUDj3FuNuR8hP8mqGBAI/QTKNTGgHUbpXq2UVART/PlIfLILh5om8
	 y/6cI12Fhh+u0J3VFEjJbiSEGxB6aXKAyc0hn622InvHXSsrk27Us8tS0wXVeZoxQO
	 LMyMB5slNlT4KQ0KkGtx/UpBQmfac+yAygvLxvTWhJjGiX0psvL+eKM+utF6n6NAbI
	 BozvfEZZiJjWNrJ27b2UhNDw37am3AwA5sigEySDif93h+Sb9Ro2bwuRLGL8eyuihU
	 k7Tv90n6epvLa4qGFkCNdL/mjWPNbqNc0CygQOvlQtYq/c1ilzomJRNnOVAL//ydiy
	 yBTnyWYEtjX9A==
Date: Tue, 14 Jan 2025 10:17:31 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Brendan Jackman <jackmanb@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 1/2] objtool: Add --Werror
Message-ID: <20250114181731.tin4imlrrkrfuerx@jpoimboe>
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250113-objtool-strict-v3-1-8b51f94957fb@google.com>
 <20250114172429.GA246689@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114172429.GA246689@ax162>

On Tue, Jan 14, 2025 at 10:24:29AM -0700, Nathan Chancellor wrote:
> 
> It might be a good idea to print a message here about why the build is
> failing, in lieu of turning all "objtool: warning:" messages into
> "objtool: error:" messages ala -Werror for C compilers, which does not
> seem simple on quick glance. Otherwise, I am not entirely sure it will
> be obvious to people why a build like allmodconfig may start failing if
> this configuration gets turned on.
> 
> https://lore.kernel.org/Z4X8j%2FqJj7ib0vkh@rli9-mobl/

Yeah, makes sense.  I'll add this:

From: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH] objtool: Change "warning:" to "error:" for CONFIG_OBJTOOL_WERROR

This matches GCC's behavior and makes it more obvious why the build
failed.

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/include/objtool/warn.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/include/objtool/warn.h b/tools/objtool/include/objtool/warn.h
index ac04d3fe4dd9..78f602b5daed 100644
--- a/tools/objtool/include/objtool/warn.h
+++ b/tools/objtool/include/objtool/warn.h
@@ -43,8 +43,10 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 
 #define WARN(format, ...)				\
 	fprintf(stderr,					\
-		"%s: warning: objtool: " format "\n",	\
-		objname, ##__VA_ARGS__)
+		"%s: %s: objtool: " format "\n",	\
+		objname,				\
+		opts.werror ? "error" : "warning",	\
+		##__VA_ARGS__)
 
 #define WARN_FUNC(format, sec, offset, ...)		\
 ({							\
-- 
2.47.1


