Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E456C2599B9
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Sep 2020 18:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730015AbgIAQnP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Sep 2020 12:43:15 -0400
Received: from mx4.veeam.com ([104.41.138.86]:44256 "EHLO mx4.veeam.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729612AbgIAQnA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Sep 2020 12:43:00 -0400
X-Greylist: delayed 419 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Sep 2020 12:42:57 EDT
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx4.veeam.com (Postfix) with ESMTPS id D7F9D1C024;
        Tue,  1 Sep 2020 19:35:48 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veeam.com; s=mx4;
        t=1598978149; bh=+BMtm99s9XyztXblpi3T4Vm9IisWYhjraisdoVw+JuQ=;
        h=Date:From:To:CC:Subject:References:In-Reply-To:From;
        b=aeTVlhLIYOGf++htY0VV5QvgL79Jr8uQJLDAQWlIMUcJ0zFsNt1A2IUYBuggR+GVU
         VOfcQcdngxBQNiNZ1uofvAPkPhdGn+YQxzuVdE551n5+v+QABEtOPhjeqW4apOT5l6
         cCtfS1J+yTV5ayOCbOgk3bmXMWTuCGpy9+6k4l5U=
Received: from veeam.com (172.24.14.5) by prgmbx01.amust.local (172.24.0.171)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.595.3; Tue, 1 Sep 2020
 18:35:47 +0200
Date:   Tue, 1 Sep 2020 19:35:27 +0300
From:   Sergei Shtepa <sergei.shtepa@veeam.com>
To:     Jens Axboe <axboe@kernel.dk>
CC:     "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "koct9i@gmail.com" <koct9i@gmail.com>,
        "jack@suse.cz" <jack@suse.cz>,
        "damien.lemoal@wdc.com" <damien.lemoal@wdc.com>,
        "ming.lei@redhat.com" <ming.lei@redhat.com>,
        "steve@sk2.org" <steve@sk2.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
Subject: Re: [PATCH 0/1] block io layer filters api
Message-ID: <20200901163240.GA18490@veeam.com>
References: <1598555619-14792-1-git-send-email-sergei.shtepa@veeam.com>
 <7a517822-6be2-7d0d-fae3-31472c85f543@kernel.dk>
 <20200901132957.GA18251@veeam.com>
 <722e85ac-f494-2cb3-4caf-d903d79a5645@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <722e85ac-f494-2cb3-4caf-d903d79a5645@kernel.dk>
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx01.amust.local (172.24.0.171) To prgmbx01.amust.local
 (172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29C604D26B637063
X-Veeam-MMEX: True
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx4.veeam.com [172.31.224.40]); Tue, 01 Sep 2020 19:35:49 +0300 (MSK)
X-Veeam-MailScanner-Information: Please contact email@veeam.com if you have any problems
X-Spam-Status: No
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Jens, thank you so much for your prompt response and clarification on your
position.

We’re totally committed to having the upstream driver as the canonical version,
and to maintaining it. 

It was probably a mistake not to build it like that right away considering it
has always been our vision, but frankly speaking we were simply too shy to go
this route when we first started 4 years ago, with just a handful of users and
an unclear demand/future. But now in 2020, it’s a different story.

We’ll get started on the in-tree kernel mode right away, and will reconvene
once ready.

-- 
Sergei Shtepa
Veeam Software developer.
