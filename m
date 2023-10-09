Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDBE7BDCFF
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Oct 2023 15:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376561AbjJINBn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Oct 2023 09:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376530AbjJINBn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2023 09:01:43 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC808F
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Oct 2023 06:01:42 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 99C6D3200A73;
        Mon,  9 Oct 2023 09:01:40 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute5.internal (MEProxy); Mon, 09 Oct 2023 09:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1696856500; x=1696942900; bh=+HqiSDOtGV7pVYCmWD6TeVp+aZyfN+epDEj
        dzDSwCc8=; b=q5Gwt06ooVR8QVXl6tJx68BvzKrEjhAiclQoQzjChzVB08CuqM3
        tJAza/SKAbt57OOc4ea888Ndd58nO+yhUSwNlQZvZ+HznFaX3Dl/IiFiLhDYjMck
        s03XnUc+Mt5tevQOkurdm3rV094HYZvmGyET9WcKSo4Cx+hn8HmNHut342JPLf1m
        NlzVh7OLn2NWXI4HoeCxoEgwW4L5AUNlQYUitroo8rqWuQucK7n3a4GXlymIRqY3
        Fw3AqTr/cN1JF5wVeslICCo+tXfy+3LRi+V/nUBl3jDIsKwCDax3Fw32j6YFwSFE
        MNsEz1ORaTjwYpJWIRWlOhPqAtLT0//2PVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1696856500; x=1696942900; bh=+HqiSDOtGV7pVYCmWD6TeVp+aZyfN+epDEj
        dzDSwCc8=; b=Qe8ZzvlJ1ZdMACxOexpk/lvAlE5NiIwUz2za4IpIRCImS+7GoRa
        UX3GD9OzqjAsOLaB9yX0QpslMHTokgZiPjsQQl5Xl0I0l2lbs5DSlaqVVQez9WDz
        lvyFBgWk5jZBAOQM9UbAdotbcaOv00/qhgzo4UwfS9Jo8K6kWFEewyd91edHgqcQ
        xAP8iqNyoGPxlebzkAo7KPyyNxTNdG9QMyJ8CxTsAmsA+G8SDrlMbUFMOpCx+pTi
        oRM0SwqHuyij1KaQ1CnRATyBKQutxzsXToVZB0w4Fi2L2Z/GB4z8KdqKcmXyKxKV
        nFbTodBcm67uzZezDwsi1DT9rT9khMCGLWg==
X-ME-Sender: <xms:svkjZRJroI60BZgal-hTyKkctb2vrRgDA2Khpso2MCPxSNLsY4jb9Q>
    <xme:svkjZdLeDXNQYzkB3Y8K9UnGkyHAMbHkVZHlel-69P37IfGqRtiyxZlDQYDAP14lP
    qC79kMd6UjY-jnLQbs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheefgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:svkjZZvjEPDBbUZtfUHCE1Q8O0AYquBWXPSeSZXSd3tG3XnSeOYe1A>
    <xmx:svkjZSaXdeXSLHo1hBY2NI33MH5OgJszZTnsaMhlKrxdE6oKbMl8yg>
    <xmx:svkjZYZDKeBoCGqK3P8FSJtMXcUFWvw2VMjwaK_0wkklZjbigL2jzA>
    <xmx:tPkjZWnNVgj5vT105OkT5ZHrbSKbUZvcSCgEeOUxd2-cv_Bevpp2Yw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id DC4D91700090; Mon,  9 Oct 2023 09:01:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <55a03e14-7a92-4cf0-82d4-5cbde64d69db@app.fastmail.com>
In-Reply-To: <20231009144610.4ff82afa@xps-13>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
 <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
 <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
 <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
 <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
 <20231009144610.4ff82afa@xps-13>
Date:   Mon, 09 Oct 2023 15:01:17 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Miquel Raynal" <miquel.raynal@bootlin.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     "Masahiro Yamada" <masahiroy@kernel.org>,
        "David Woodhouse" <dwmw2@infradead.org>,
        linux-kbuild@vger.kernel.org,
        "Richard Weinberger" <richard@nod.at>,
        "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        linux-mtd@lists.infradead.org,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with __refdata
 to prevent section mismatch warning
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 9, 2023, at 14:46, Miquel Raynal wrote:
>> On Mon, Oct 09, 2023 at 10:43:46AM +0200, Arnd Bergmann wrote:
>> > On Mon, Oct 9, 2023, at 09:22, Masahiro Yamada wrote: =20
>> > > On Mon, Oct 9, 2023 at 5:02=E2=80=AFAM Uwe Kleine-K=C3=B6nig <u.k=
leine-koenig@pengutronix.de> > Can we instead question the use of module=
_platform_driver_probe()?
> I don't have the history in mind, but why not just switch to regular
> module_platform_driver() registration instead? It seems like the
> original authors just did not care about the remove path and were
> happy to skip its implementation.
>
> On mtd devices one can argue that the flash underlying stores the
> rootfs and thus cannot be removed, but I believe today this is a
> questionable (software) design.

It was changed to module_platform_driver_probe() in commit
3a2a13fa902d2 ("mtd: txx9ndfmc: use module_platform_driver_probe()")
with a short changelog text:

commit 3a2a13fa902d232a1e56582647aed6cb2591349b
Author: Jingoo Han <jg1.han@samsung.com>
Date:   Tue Mar 5 13:31:24 2013 +0900

    mtd: txx9ndfmc: use module_platform_driver_probe()
   =20
    This patch uses module_platform_driver_probe() macro which makes
    the code smaller and simpler.
   =20
    Signed-off-by: Jingoo Han <jg1.han@samsung.com>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

Instead of just simplifying the code, I think that was actually
a bugfix because it prevented both the probe and remove callbacks
from getting called after getting dropped (deferred probe or
unbind/rebind). Using module_platform_driver() is probably
even better here, but then we need to remove both the __init
and __exit annotations.

      Arnd
