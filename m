Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B16F7A5B51
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Sep 2023 09:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbjISHix (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Sep 2023 03:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231917AbjISHij (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Sep 2023 03:38:39 -0400
X-Greylist: delayed 487 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 19 Sep 2023 00:38:33 PDT
Received: from mail.leeswilly.pl (mail.leeswilly.pl [89.116.26.225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126EE18E
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Sep 2023 00:38:32 -0700 (PDT)
Received: by mail.leeswilly.pl (Postfix, from userid 1001)
        id 51B74761165; Tue, 19 Sep 2023 09:30:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leeswilly.pl; s=mail;
        t=1695108622; bh=qCQG4c3C0tvkuSSy6okg6Td4OKi9mrw7rI9pE9SwJ9g=;
        h=Date:From:To:Subject:From;
        b=QZqt/2N82nA8knJ8zxsDjlewoqa/VgKTV0l+H7oPAP2VgiLl4OLB0cUxa9RGOFLLV
         iNuYjMRTDCIza7WqazLqQECrg1N1bOHKnR9TGmM6qA2vFrGqsrYOkGoKPMS+3dvNNK
         sGKOrEHh3BZdYxArUUq+TZS4gI23VOSVlvb5vBtZtVMcwNriZ9Kywxo+XNLa1/Bfvb
         ghuZ98dMnZl/KEmNsh0GaaHp62CHSkENJlQ62uKOIFIZN24rHeZ9gaHyP/nSfAXANz
         WQBgL7miWLevwUqs/0yhgNaES/xaFLZk3X/QziaY+TiZHQZ7H/MqQbqyWVLAz3GR1I
         9M+Ef0mMMlU8A==
Received: by mail.leeswilly.pl for <linux-kbuild@vger.kernel.org>; Tue, 19 Sep 2023 07:30:18 GMT
Message-ID: <20230919084500-0.1.3z.bb9k.0.fob483cczn@leeswilly.pl>
Date:   Tue, 19 Sep 2023 07:30:18 GMT
From:   "Jakub Lemczak" <jakub.lemczak@leeswilly.pl>
To:     <linux-kbuild@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leeswilly.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SORBS_DUL,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam
Jakub Lemczak
