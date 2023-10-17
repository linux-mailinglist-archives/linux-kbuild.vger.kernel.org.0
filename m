Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8868C7CC50F
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Oct 2023 15:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234635AbjJQNpz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Oct 2023 09:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234976AbjJQNpy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2023 09:45:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52631EA
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Oct 2023 06:45:53 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD1FC433C7;
        Tue, 17 Oct 2023 13:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1697550352;
        bh=bsGdEMFXOwsrc60Ta6ha6me6H2zHsuO05hAgJWbwpiU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dgJ6lMzTY4x4C6eh4m7YVU51SLRvmFHQTRv6yULW4c0fXz/vvOHbyenm1Ovb+PsZD
         BcOEcT4T/hrzyYTpT4lsR0l0v5R8aH0sWJGrwBWarq0Jw6oukHR1OEZrVRBvrheUGp
         sN+b4OeXaZhkcYq1FurKUW/KGUFUWyB2eB552cJk=
Date:   Tue, 17 Oct 2023 15:45:48 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        Richard Weinberger <richard@nod.at>,
        linux-mtd@lists.infradead.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
Message-ID: <2023101727-undying-hull-1e4b@gregkh>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
 <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
 <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
 <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
 <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
 <4c27130c-e924-4f24-b833-794e0acac858@app.fastmail.com>
 <20231016102134.q6k2jb5ewu3flg6j@pengutronix.de>
 <CAK7LNARSxEZeKGoFAdGp1uhQVBrdGByDD4cJNMc_HCkmTiFF+g@mail.gmail.com>
 <20231017132045.afswdgcv4axjf6jj@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017132045.afswdgcv4axjf6jj@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 17, 2023 at 03:20:45PM +0200, Uwe Kleine-König wrote:
> with 19 in drivers/rtc (I added Alexandre to Cc:), 4 in drivers/mtd, 6
> in drivers/usb and otherwise here and there a driver. That doesn't look
> insurmountable.

I'll gladly take patches to change this for drivers/usb/ stuff.

thanks,

greg k-h
