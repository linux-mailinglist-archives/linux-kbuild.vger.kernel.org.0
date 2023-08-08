Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82C81774A7D
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Aug 2023 22:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbjHHUaI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Aug 2023 16:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231162AbjHHU36 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Aug 2023 16:29:58 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5650B8E97D
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Aug 2023 10:31:14 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-63cf7cce5fbso40771916d6.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Aug 2023 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691515873; x=1692120673;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dcYuNvQ6LRTr9Kqku3e5x987a4JKtIpBF7s0doGAzwo=;
        b=vGW2IHcvfu9EV1axxq+MdPcnl/KytPvI8hqjO8oUbeKaaLkY73kn0g0b31ckK6W4xH
         PTh8xW6tbPWYUqtT4nRHOz1fkjU/Hx9qtcA1kqKzmoGnU2Vu0WRpGxKDYA8RBPIBDnH/
         gdGfQ2E8KB70maO0vJeK8nkPxhjWFA2ctKQkU58EnNBVZBKkjznyJsfSJjDIxOT+WXhm
         0I0HfStOtI7DCAZb1cvFJWjIHD39rHVNCgRteG5WsiY/LThcfV9yrEgY+SjDKVF1Cd2/
         D31ecBVe7rOx5/L88WeH6kU7umudLlqya/8PvDA0NGcRwIEj+ZnDaUbmxyU5X355dIi6
         8Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515873; x=1692120673;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcYuNvQ6LRTr9Kqku3e5x987a4JKtIpBF7s0doGAzwo=;
        b=im6GTwcevz5R881WGX7U59ssucNSeLtazY3Bk75zdbFEWAYsijNcIXn2Cv+nK0qhby
         FAh1xxhBa91eGMDX6fXqX1hiZAdNPVtAk3HI+DkEfMpPjXGesw37SRPIv3LWXGR8iMUF
         j1CkhR1+lAl354cjjIPtfjvXzb2bOjN04QeGITySowrTKr9qOusbnT/+EQD5s7EMhhZL
         XY83FPsj0mMxiHUTzdOPczqQ/7Ah/AGfbJRMMEAusYq04m2U9O1Ne6suURZabrfGTkb6
         5Sohk9c9tCk6UkZoq6fzCtHWXg/0O02Eau7tXlkkunV4cs8LFe58eOE6kmUA+VphWtLR
         JHvQ==
X-Gm-Message-State: AOJu0YyacCeEl5i3yfesheTOdQ5I3WCHLkItcOZZGvbtHYPqLpoNgeRe
        GeZiI+v0D/XOUJe8UWuDS1r2DUaPfZYT1IkYkMAptTAlCFZzYQx3wPXEUw==
X-Google-Smtp-Source: AGHT+IGL+m3AXxT0UjxI4bfbYWJD+7UTXrk+ZWN8Jj/k4gy1INz1dZtoQF1N/LGotEPcBGSZheZbiZNFTHfNpKONXl4=
X-Received: by 2002:a0c:dc08:0:b0:62d:ee5a:514b with SMTP id
 s8-20020a0cdc08000000b0062dee5a514bmr113802qvk.11.1691515872827; Tue, 08 Aug
 2023 10:31:12 -0700 (PDT)
MIME-Version: 1.0
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 8 Aug 2023 10:31:02 -0700
Message-ID: <CAKwvOd=KCT-aqcWctRPVhEoOjkjP+y5TpNK1hV9mq6PuZDvApQ@mail.gmail.com>
Subject: missing separator. Stop. after rebuild
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

$ wget https://download.01.org/0day-ci/archive/20230808/202308081050.sZEw4cQ5-lkp@intel.com/config
-O .config
$ make LLVM=1 ARCH=um -j128 arch/um/drivers/port_kern.o
$ make LLVM=1 ARCH=um -j128 arch/um/drivers/port_kern.o
arch/um/drivers/.hostaudio_kern.o.cmd:843: *** missing separator.  Stop.
$ sed -n -e 842p -e 843p arch/um/drivers/.hostaudio_kern.o.cmd
$(deps_arch/um/drivers/hostaudio_kern.o):
o)

Any idea if this is some form of malformed Makefile rule, or actually
a compiler bug generating these .cmd files?

-- 
Thanks,
~Nick Desaulniers
