Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513B1308E85
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Jan 2021 21:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbhA2Ucm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Jan 2021 15:32:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:39532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232600AbhA2Ub4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jan 2021 15:31:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01DAC64DDE;
        Fri, 29 Jan 2021 20:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611952268;
        bh=5AnV61gmXOfqHr//8NZNzBf/Xi7Rh8L5djBf5PwUuLY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NKoGt53qRrD5SS+3iIwf/HHFBvHh8Ag9JneHVZPzJc7T2eLtggp4k5xop9/Zmar/c
         0y0YWhb22+/wAez9KE3caMaevB3IaA6ZHL36GpfWEsN0wBYhsZxv0ZeDJ+ijEplW8o
         9qBG7SD0TPT9btO/EBBp79oCyyVwgyqv3ufcJpgVC4VaoDi36jg5dnue51k0iqazwi
         ExSSk+ae3hKrK67Dj4pa/yMTfflsisLh1i2MEi+qmYHG9t5KcrP+GICtNgHG1GkFdf
         ILb/jUgQbo69EoqPiTCv6rMyYxSsJPVh19RqWO1Tv7Zny3DHn3B1cAgmanBUUYD980
         9ITQJ1EsVCMyQ==
Date:   Fri, 29 Jan 2021 13:31:06 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH] Documentation/llvm: Add a section about supported
 architectures
Message-ID: <20210129203106.GA2658360@localhost>
References: <20210114003447.7363-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114003447.7363-1-natechancellor@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 13, 2021 at 05:34:47PM -0700, Nathan Chancellor wrote:
> The most common question around building the Linux kernel with clang is
> "does it work?" and the answer has always been "it depends on your
> architecture, configuration, and LLVM version" with no hard answers for
> users wanting to experiment. LLVM support has significantly improved
> over the past couple of years, resulting in more architectures and
> configurations supported, and continuous integration has made it easier
> to see what works and what does not.
> 
> Add a section that goes over what architectures are supported in the
> current kernel version, how they should be built (with just clang or the
> LLVM utilities as well), and the level of support they receive. This
> will make it easier for people to try out building their kernel with
> LLVM and reporting issues that come about from it.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Jonathan, did you need anything else from me on this, or does Masahiro
need to pick this up?

Cheers,
Nathan
