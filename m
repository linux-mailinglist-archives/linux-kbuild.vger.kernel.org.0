Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F82E72A640
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jun 2023 00:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjFIWaJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jun 2023 18:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjFIWaI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2023 18:30:08 -0400
X-Greylist: delayed 409 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Jun 2023 15:30:07 PDT
Received: from out-61.mta0.migadu.com (out-61.mta0.migadu.com [IPv6:2001:41d0:1004:224b::3d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665C3359D
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Jun 2023 15:30:07 -0700 (PDT)
Date:   Fri, 9 Jun 2023 18:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686349396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=pPCFu9nGwTDXVjZG93B97pSmz0rNeRzc9U/0whIt6jY=;
        b=hmBYHByfP4PsW2IvBN53vWJv8FytDqn2P1nfl6um7UXRewREHbziHkajaHVo++OaDPX27x
        eF9bceiPzOCrvRqzrdNTXQfta2lIehUIV5aEDnrNvWbeyWT8s+G7+qBxJFPQTO58yeEOzV
        4Kaa3ApNAAUTLgWGWCHHIwkAAh4in0w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Subject: Specifying CFLAGS for a directory on the command line
Message-ID: <ZIOmUkXlegycIExQ@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello kbuild maintainers & list,

Years ago I used to be able to specify additional CFLAGS for a specific
subdirectory on the command line, which I used for enabling gcov
profiling without editing the subdirectory makefile, like so:

  make GCOV_PROFILE_fs_bcachefs=y

But this stopped working ages ago, I believe in the 3.x era. Does anyone
know if there's a more modern way to do this?

Cheers,
Kent
