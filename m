Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCA47807B4
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Aug 2023 11:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358892AbjHRJBu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Aug 2023 05:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358885AbjHRJB3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Aug 2023 05:01:29 -0400
X-Greylist: delayed 1480 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Aug 2023 02:00:54 PDT
Received: from mail.leachkin.pl (mail.leachkin.pl [217.61.97.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937323C27
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Aug 2023 02:00:54 -0700 (PDT)
Received: by mail.leachkin.pl (Postfix, from userid 1001)
        id A054B842EF; Fri, 18 Aug 2023 09:16:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
        t=1692346584; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
        h=Date:From:To:Subject:From;
        b=YWhDV3tE8V4BZfI8kyZk+qAIi1HeTDkukJeN4tyWccw7AgM6sCiKtzr3dIEvuQfeI
         p3XVv4kpcyX09il/LgDsCxW9cY9TUCVtAi8HiufB1FP26RVVtAITLav8XYVVJiqZad
         +6r3gZJXZHvYlBQ4kTEPgSY99udS6M3E/lePe3KGYLSBvRYM/NDZvRs1ofoleclCB8
         hCEfyY1WGWYmiB5Bv6M/pyygFPBH90TKbTwDwUgSnFyCrXyUQOmMJ4yMMDGsvJyWSf
         z7n09mJUVMFfd3su/ks7juW/RpAVbSaIQK00yu7MIAj7RXNGHAczLG7QwL5IzDjtnz
         HFs10fBzWxB6Q==
Received: by mail.leachkin.pl for <linux-kbuild@vger.kernel.org>; Fri, 18 Aug 2023 08:15:51 GMT
Message-ID: <20230818074501-0.1.4u.cu2g.0.ed6ologvye@leachkin.pl>
Date:   Fri, 18 Aug 2023 08:15:51 GMT
From:   "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To:     <linux-kbuild@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam,
Jakub Lemczak
