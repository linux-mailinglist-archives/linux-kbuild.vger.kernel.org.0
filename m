Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 762AF60D798
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Oct 2022 01:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbiJYXAh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Oct 2022 19:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbiJYXAf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Oct 2022 19:00:35 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3D0CE981
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Oct 2022 16:00:33 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id g24so7312501plq.3
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Oct 2022 16:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s6LZP8hvZm1H8c+TGDoLOM2VTr5Lxnor/nw5sFV/2mY=;
        b=eBUosIjwxzoCivbiFw947tiAH5Kc5Zjv1vE5XKCjauANrPGnJZaAjWvYUDGuc2p3ra
         D0o1CDbvF+anvekmPVnVtDC7TRRKwRsL6DsbvrN33f10kJRVrqHzLepIxWOfr8YWUHdG
         5iP/4geENpl6p+WCcY5oEeLfXkWqGUaRijJpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6LZP8hvZm1H8c+TGDoLOM2VTr5Lxnor/nw5sFV/2mY=;
        b=XXDs+F0smd+QCyq3dBhHUCytB3MOtSiD5FgJppWEHXvKowWmheMIcB9J3lXcep/8rk
         KhqjdhYhJT/nQ1FT2iiL4sQZSFzjmbxsh9ogxlvFdT8ywmJdFLWPu0t0YKchWei79sBH
         WV+6GGVK2l0mkL5LPXKnQ3K3aT93lP7s0dcp2YqJPVsc55cqD9NkQ4agrhxHkUO5nZSE
         BbmdLBiVQmj8NytQF7HuVEU1EQ0brPdUwjpxdVL5qEGMgoTmDBzz/KxN7IPIgyNio3kr
         KagebISNrqNx4Vgz/g0xbnlLfMGSh8TGZMNRj2Nz/L4/Ky+pBy9yJhOrwMy5QuW+hu20
         lUTA==
X-Gm-Message-State: ACrzQf0qqn8ne3ivxbJOWSjQyHWYDob3N3br7L4g87ux3y7tku19GLKd
        oMvODVOBI3BfbjiKW/VPzZYEaA==
X-Google-Smtp-Source: AMsMyM54nuuM6c/UCbGYg0BC7n31Zk4wLqgiVvdCYEO4DeWdRrGI+Ggys2dZfI4gYVoed9ITHFD2RA==
X-Received: by 2002:a17:902:ec8a:b0:185:5462:261a with SMTP id x10-20020a170902ec8a00b001855462261amr40802031plg.160.1666738832501;
        Tue, 25 Oct 2022 16:00:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id cc21-20020a17090af11500b002086ac07041sm90501pjb.44.2022.10.25.16.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:00:31 -0700 (PDT)
Date:   Tue, 25 Oct 2022 16:00:30 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Gabriel Paubert <paubert@iram.es>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-toolchains@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild: treat char as always signed
Message-ID: <202210251555.88933A57F@keescook>
References: <20221019162648.3557490-1-Jason@zx2c4.com>
 <20221019165455.GL25951@gate.crashing.org>
 <CAHk-=wiMWk2t8FHn0iqVVe1mn62OTAD6ffL5rn9Eeu021H9d1Q@mail.gmail.com>
 <20221019174345.GM25951@gate.crashing.org>
 <CAHk-=wiNNKLFfa0d+Hk=Wm5caiKjLY4V9wwu9DhcSSwPuMbxrg@mail.gmail.com>
 <Y1Elx+e5VLCTfyXi@lt-gp.iram.es>
 <CAHk-=wiYtSvjyz5xz2Sbnmxgzg_=AL2OyTiRueUem3xzCzM8VA@mail.gmail.com>
 <Y1OIXdh3vWOMUlQK@lt-gp.iram.es>
 <CAHk-=wgaeTa9nAeJ8DP1cBWrs8fZvJ7k1-L8-kjxEOxpLf+XNA@mail.gmail.com>
 <Y1Wi29MuYlCRTKfH@lt-gp.iram.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1Wi29MuYlCRTKfH@lt-gp.iram.es>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 23, 2022 at 10:23:56PM +0200, Gabriel Paubert wrote:
> On Sat, Oct 22, 2022 at 11:16:33AM -0700, Linus Torvalds wrote:
> > Practically speaking this might be a bit painful, because we've got
> > several different variations of this all due to all the things like
> > our debugging versions (see <linux/fortify-string.h> for example), so
> > some of our code is this crazy jungle of "with this config, use this
> > wrapper".
> 
> I've just had a look at that code, and I don't want to touch it with a
> 10 foot pole. If someone else to get his hands dirty... 

Heh. Yes, fortify-string.h is a twisty maze. I've tried to keep it as
regular as possible, but I admit it is weird. On my list is to split
compile-time from run-time logic (as suggested by Linus a while back),
but I've worried it would end up spilling some of the ugly back into
string.h, which should probably not happen. As such, I've tried to keep
it all contained in fortify-string.h.

Regardless, I think I'd rather avoid yet more special cases in the
fortify code, so I'd like to avoid using transparent union if we can. It
seems like -funsigned-char and associated fixes will be sufficient,
though, yes?

-- 
Kees Cook
