Return-Path: <linux-kbuild+bounces-6527-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACF0A81AC3
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 03:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 423D3467F2A
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 01:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5D214F104;
	Wed,  9 Apr 2025 01:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYus8xA7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617B72940F;
	Wed,  9 Apr 2025 01:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744163934; cv=none; b=oGOK3t/yqYxoCXbxTrRUZbGyxo5g5L6RD6l7EYH3Zw48w+piTBfXjhLckfFRyWHrGrUHqLUHfSs7jvbKMHTrUORLOJJJ+mlmZVznTgBS4kQT7p4DZABQQiLHGcOSfXuG/duGIoR4qKrtxUTFB/1BVLq4ldDZvUjM/oFkXkR9NF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744163934; c=relaxed/simple;
	bh=PtgBP6zEsA6YsxYnc/Q4fIwjwx+7QJDP4Jr2jAjNwos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUAXzF1iSXmnbGXJ++c+mummWtcaNHIbmhO8JSfP3UfDcpUybvJNUObQPSEv4YoofDlgqazv0nIai2hWQM7kfNqY/RGlsiqKzQtG0kwK/7yfGgrdCM7XY0BKQQBnrpdmNyB6SfxPhBKQSDrzoi6AxELBrVoq2AI5CQ9PRgz/REM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYus8xA7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5550BC4CEE5;
	Wed,  9 Apr 2025 01:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744163933;
	bh=PtgBP6zEsA6YsxYnc/Q4fIwjwx+7QJDP4Jr2jAjNwos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYus8xA7LMm0lmkGqzebV49qB9QFBm4rUS6aWxfo+HX7wpZ8lmS5l1FqtZohBc/6s
	 HGB2nUuh4AMD0jvW3f9fOTI9wU/+TfloctiIkxHIoxGdONE6C2vivk6o4yYS3Da8+b
	 3r+2yvhHd6+BDyjD563pimFhwg3jkDTGuAh1A/4UFb29CQ5yUn3Vgd/i7eiL88qq66
	 q6+8k5bVEujoAtEV1F8FlrSZq9qyjgJwkAg60fC1eAx4drmS/F2Qsw5Iy+hd3CEY16
	 UnMen7sKOW4AMMcOQIphJA3/mb7fxDWRqpkQuIoqS+Ty3OQJe6Gocu1g/SF5dJ2mH6
	 CDo7NML7KpDsA==
Date: Tue, 8 Apr 2025 18:58:49 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Rae Moar <rmoar@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	Sergio =?utf-8?B?R29uesOhbGV6?= Collado <sergio.collado@gmail.com>, David Gow <davidgow@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Mostafa Saleh <smostafa@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] scripts/mksysmap: skip objtool __pfx_ symbols
Message-ID: <ycgbf7jcq7nc62ndqiynogt6hkabgl3hld4uyelgo7rksylf32@oysq7jpchtp4>
References: <20250328112156.2614513-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328112156.2614513-1-arnd@kernel.org>

On Fri, Mar 28, 2025 at 11:48:19AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The recently added testcase for overly long symbols triggers when
> CONFIG_FUNCTION_PADDING_CFI is set:
> 
> Symbol __pfx_snnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n too long for kallsyms (517 >= 512).
> Please increase KSYM_NAME_LEN both in kernel and kallsyms.c
> 
> Change the mksymtab table so the prefixed symbols are not included
> in kallsyms.
> 
> Fixes: c104c16073b7 ("Kunit to check the longest symbol length")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I'm not sure we want to remove the __pfx_ symbols from kallsyms. There
can be actual code there.

For example, FineIBT writes code in the __pfx area which can trigger an
#UD.  And we'd want a sane backtrace for that.

Maybe objtool should error out when trying to prefix a function with a
name longer than (KSYM_NAME_LEN - 6).  And the kunit test could be
adjusted accordingly for CONFIG_PREFIX_SYMBOLS.

-- 
Josh

