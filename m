Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E302B739E9C
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jun 2023 12:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjFVKfL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Jun 2023 06:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjFVKfJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2023 06:35:09 -0400
Received: from out-4.mta0.migadu.com (out-4.mta0.migadu.com [IPv6:2001:41d0:1004:224b::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C641738
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jun 2023 03:35:07 -0700 (PDT)
Date:   Thu, 22 Jun 2023 06:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1687430105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mh4iWn2T15kkCOfNaYuJWklAiUL6krtTYiQX5HwjesE=;
        b=sGNYWFvlJ7d8tVGSpGGotQOBpzTtQbbECphPmDuVfnhcm1lBhfHyRFuuyKA6N8LwEIkx3N
        hRrNlYEUoTFChj6ftXesnQLdGtUhckyqYhgDdmpU9NnMdddYnqFLM+EJ/R8XPdO4mm291t
        QP7FV5ShO9aE1NrvOCH7FuPUi/+UxeQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Peter Oberparleiter <oberpar@linux.ibm.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: Specifying CFLAGS for a directory on the command line
Message-ID: <20230622103501.bptpkkb4hpjejprh@moria.home.lan>
References: <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
 <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
 <ZIO3leNyqOeJw6u3@moria.home.lan>
 <bddaf556-6417-ffaf-2301-9caf47089b21@linux.ibm.com>
 <ZIiz4WjIB6r8Gz4l@moria.home.lan>
 <a077ce91-1cfc-5c15-aa0e-1cf90f71e719@linux.ibm.com>
 <ZIwDIOxq3rE/8QUV@moria.home.lan>
 <c45f6e75-da4e-e496-e3c4-4fdfea29104a@linux.ibm.com>
 <ZIz+NFzAnyAKmV9u@moria.home.lan>
 <e773effa-29a0-0e57-36e8-9b4cba1a494f@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e773effa-29a0-0e57-36e8-9b4cba1a494f@linux.ibm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 21, 2023 at 10:54:10AM +0200, Peter Oberparleiter wrote:
> Leaving the method of how this input data is processed inside kbuild
> aside for a moment, I'm wondering if specifying the list of directories
> via a CONFIG symbol instead of make parameters would work equally well.
> 
> Initially I thought this would be too complex to process using Makefile
> functions alone, but with the logic shown above this could be relatively
> simple to achieve. Also having given this some more thought, a CONFIG
> symbol indeed seems like a better fit considering aspects such as
> reproducibility of builds and config symbol documentation.
> 
> The CONFIG symbols could look something like:
> 
> - CONFIG_GCOV_PROFILE_INCLUDE: list of directories to include in
>   profiling
> - CONFIG_GCOV_PROFILE_EXCLUDE: list of directories to exclude from
>   profiling
> 
> where the precedence would be: exclude list > include list >
> GCOV_PROFILE_* specified in Makefiles > CONFIG_GCOV_PROFILE_ALL
> 
> Sub-directory handling could work similar to how you described it for
> the make parameter, i.e. an include/exclude statement for a parent
> directory would also apply to sub-directories.
> 
> What this approach work for your use case? Note that I'm not asking you
> to implement this - I just want to get a better picture of how a generic
> solution could look like.

Yeah, that would work fine. I'm assuming the config option list would
just be a comma separated string?

btw, here's the results - fully automated code coverage analysis
integrated into the CI:
https://evilpiepirate.org/~testdashboard/ci?branch=bcachefs&commit=eac40840098bfbb5fa1711f6bbce71b27bbccb89
https://evilpiepirate.org/~testdashboard/c/eac40840098bfbb5fa1711f6bbce71b27bbccb89/lcov/

And the result of the makefile work is that adding a gcov variant of an
existing test is as easy as:
https://evilpiepirate.org/git/ktest.git/tree/tests/bcachefs/gcov-xfstests.ktest
