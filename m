Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF906781C2F
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Aug 2023 04:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbjHTCsN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Aug 2023 22:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjHTCr7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Aug 2023 22:47:59 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208E5A5DE7
        for <linux-kbuild@vger.kernel.org>; Sat, 19 Aug 2023 19:31:03 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6bcd4b5ebbaso1780978a34.1
        for <linux-kbuild@vger.kernel.org>; Sat, 19 Aug 2023 19:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692498662; x=1693103462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aq02rNNrFFRXd2WHrHFiWmxFWaZMSaBzFscYMGYTbjA=;
        b=E+RvrWXJ+/mmbIkNM98G9zdglrursJ9xu6mgnfSaHJm4sNNBwUsyQrLF1hXSDmLvov
         Mc3IUjMLg91svgyaycEXz+ciTWTEwNVDdyHmxJ8i1flmjMgYC5sJeKswmMKUrXRsgElh
         E0oEb5wsCOuDvlbiQJBYFc2SlqG0zG08hGj00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692498662; x=1693103462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq02rNNrFFRXd2WHrHFiWmxFWaZMSaBzFscYMGYTbjA=;
        b=UCr/wKxUIPGk8gFfA0uP1Yf/J2tDY8GAqlBZAlnnfNmdMfleLbXPfuKKjeSK5ZpNay
         iqYsP7IIoj/s1rZLZG7/HSOSs3hkhOt3MrLNYMk2vW2mmLnhYkfCt9gOQdcBnm6F0p2H
         YtyPvqyq6D5eSy6SsdOjdXTNpgi9UINKTpkODfvA3+PY6ffFI3QJ7HmLvnZTFcN7l5bT
         AQQl/b14vq8pYxPQmaXWcSkwwCXKrCPzrW+wq7Chuah49YXdiWuWZGYGgMk7YaMhYy8i
         Qneh6hjxC7cAyqEjwyjMqd0c5PVrzhibY780WSL9QTl2JdJIcrsfAH67wTimYUTmWIFH
         11Rw==
X-Gm-Message-State: AOJu0Yxbr6u0Xc19Wcow6XzVLySzk1whPbOxnTRcyTPtkqQ3MevDZ3mG
        R4vZHcf9G0xiyzlLhbFT68Pneg==
X-Google-Smtp-Source: AGHT+IHwXOJMPBiAOiWzmPiEXAnRJDxCfdaHaSImiaxxvy0xUo3fdhVz+3lvjJNZExZMz7ma9epV3w==
X-Received: by 2002:a05:6870:6387:b0:1b3:cb1f:cd1f with SMTP id t7-20020a056870638700b001b3cb1fcd1fmr5370836oap.0.1692498662465;
        Sat, 19 Aug 2023 19:31:02 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id y4-20020aa78544000000b006862b2a6b0dsm3845988pfn.15.2023.08.19.19.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 19:31:01 -0700 (PDT)
Date:   Sun, 20 Aug 2023 11:30:57 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Jesse T <mr.bossman075@gmail.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: kconfig: list unknown symbols in the old .config
Message-ID: <20230820023057.GJ907732@google.com>
References: <20230816124221.GH907732@google.com>
 <CAJFTR8SW=csT9o6iFdaVn7L8P38xYwcf2oU0Qd762=kOtrcs7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJFTR8SW=csT9o6iFdaVn7L8P38xYwcf2oU0Qd762=kOtrcs7w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On (23/08/19 15:54), Jesse T wrote:
> > We recently were hit (unnecessarily hard) when after kernel uprev we
> > figured that something wasn't working. The root cause was a rename of
> > the CONFIG_FOO option between kernel releases, which make oldconfig
> > doesn't warn/notify about.
> >
> > Would it be possible to add either a new --listunknown mode to conf or
> > to somehow make it conf_warning("unknown symbol: %s\n", line) when it
> > reads a line from oldconf that it cannot sym_find()?
> 
> This makes sense and I brought up this scenario a couple of days ago
> on a recent patch.
> I can make a patch for this if needed.

I posted an RFC patch a couple of days ago
https://lore.kernel.org/all/20230817012007.131868-1-senozhatsky@chromium.org/T/#u
