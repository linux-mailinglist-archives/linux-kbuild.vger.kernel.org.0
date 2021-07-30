Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62953DC18C
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jul 2021 01:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbhG3X3e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 19:29:34 -0400
Received: from pv50p00im-zteg10011501.me.com ([17.58.6.42]:59800 "EHLO
        pv50p00im-zteg10011501.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233555AbhG3X3d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 19:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
        s=1a1hai; t=1627687396;
        bh=4/aQNK88t2BegMqzsfndPfebMdjLWEajP+tB9Yr6Z2g=;
        h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
        b=XyR8IvcWh2Yfli0tViLdMK1yH+61H/FNyC8h5qwo1FXK6ogVFPIPZCHAKQKGFFddq
         lYQhtIUey/B0nG1sdLePg1Licp9DcDhCuw1k6ZBoDOWWnpGD0zWwX6xuGZ90tSbUjg
         NQ8nnP3PrLb5udE57J/qnf2wbzNKgOunCFXBDZ49DsS22VHagwJSLdvE/bC9WQ8eU6
         V8lxpXaFxv4qqVO/L9HP2gdNZoyLsJWWSyeBlcZdoXw+EDD8lwcfanHqSeRbzMxOU+
         io4QzuldoswUF8SYbn/tQZqeAGMviU1TtDJ5vfPo79n+TOuzzztKfqXgmgaGinJTCT
         hn/3dDdbtvz2A==
Received: from smtpclient.apple (075-142-087-102.res.spectrum.com [75.142.87.102])
        by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id E24B1B003A7;
        Fri, 30 Jul 2021 23:23:15 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From:   Dillan Jackson <a1.jackson@icloud.com>
Mime-Version: 1.0 (1.0)
Date:   Fri, 30 Jul 2021 16:22:55 -0700
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-Id: <3B1B0473-00F1-46A4-9C5A-06EAF7FA8340@icloud.com>
Cc:     gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        ojeda@kernel.org, peterz@infradead.org,
        rust-for-linux@vger.kernel.org, torvalds@linux-foundation.org,
        wedsonaf@google.com
To:     linus.walleij@linaro.org
X-Mailer: iPhone Mail (18G82)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-30_11:2021-07-30,2021-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=530 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2107300157
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Monies?
