Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B68407336FE
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jun 2023 19:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242470AbjFPRB1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Jun 2023 13:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244204AbjFPRAl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Jun 2023 13:00:41 -0400
Received: from out-33.mta0.migadu.com (out-33.mta0.migadu.com [IPv6:2001:41d0:1004:224b::21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EBBEB5
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jun 2023 10:00:29 -0700 (PDT)
Date:   Fri, 16 Jun 2023 13:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686934827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UpEzonWWYg7jSvyYhQNh8mY4km+28it6D+EFpiWRWkQ=;
        b=rryMa/o2/FTM0HCe1qaimzRUzZKZ7wSFLRELkLEpHgLKdLQuzlMwot9VuvPrMzP9wfGUTg
        OPdsVHDdLQ/gEn0n3kda1TpijPMsbnS62Q4GPW5WTNRM8W2cldyofwvRG1t9JJoPs0hGbt
        gH8pVFKWxiK2scQtML3s+0JnfkFf6G8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Peter Oberparleiter <oberpar@linux.ibm.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: Specifying CFLAGS for a directory on the command line
Message-ID: <ZIyVKQOIek9gglbs@moria.home.lan>
References: <ZIOmUkXlegycIExQ@moria.home.lan>
 <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
 <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
 <ZIO3leNyqOeJw6u3@moria.home.lan>
 <bddaf556-6417-ffaf-2301-9caf47089b21@linux.ibm.com>
 <ZIiz4WjIB6r8Gz4l@moria.home.lan>
 <a077ce91-1cfc-5c15-aa0e-1cf90f71e719@linux.ibm.com>
 <CAK7LNASjy5Gb31rNx4aqLzqmR01b8YYkOFDwD8L93uYmQnzrKw@mail.gmail.com>
 <625f2720-9664-4cab-a4c6-b30c4b902c54@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <625f2720-9664-4cab-a4c6-b30c4b902c54@linux.ibm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 16, 2023 at 06:45:46PM +0200, Peter Oberparleiter wrote:
> I don't feel very strongly about this specific feature - it seemed to me
> that it could be implemented in a non-intrusive way and it provides
> value to at least one developer.

And it'll get us better tooling integration.

I'm the author of ktest [1], which does interactive and automated kernel
testing. With this feature I'll be able to generate gcov/lcov output
with a single argument to build-test-kernel, and hopefully with a bit of
extra work get code coverage analysis as part of CI runs.

[1] https://evilpiepirate.org/git/ktest.git
