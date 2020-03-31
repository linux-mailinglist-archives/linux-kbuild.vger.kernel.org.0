Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80C22199107
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 11:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731913AbgCaJQk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 05:16:40 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:52490 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730328AbgCaJQi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 05:16:38 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02V9BPwH080439;
        Tue, 31 Mar 2020 09:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=soT205CLbo3pSZEAx9AVjNKeXiqZkOzPFfSpgHTqh+M=;
 b=KKKuEq4ZbL21qiOck4SWuo0lJ4mO0T+NNuoZZdFAcdVJtohEC/BLrX0w9NUhzRiLNoOh
 G6O+gw140niz57E14RFYNOVpM8oyF9+tHiH47ejsxspUucqxPQgsX+KPiEX0v80B2gvm
 G2Zuu0c6Bb4BLcMPfuXvSlBC2N2aJ6rRxZOO6OdECLNnh0GS2rS3Z3jP+jk5POszxnLE
 4pijWU5bcmpShEn1rnX3W/UdV/upHH3sMu8QhdkxFNh0Xwcru6yuwITXesDvGZxcZqtw
 lcMBf8iV8RmTVDeRoI3HJDEnjo/NN6esFWteR280KbCugmc75XHcTnPUpdQ9s4s4EBaT +g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 303ceuxeg2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 31 Mar 2020 09:16:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02V96ubU002205;
        Tue, 31 Mar 2020 09:16:34 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 302g2dq5kj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 31 Mar 2020 09:16:34 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02V9GXDA017837;
        Tue, 31 Mar 2020 09:16:33 GMT
Received: from [10.175.15.184] (/10.175.15.184)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 31 Mar 2020 02:16:33 -0700
From:   Vegard Nossum <vegard.nossum@oracle.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: single target builds are broken
Message-ID: <a5ce79eb-be9d-df97-0b58-5aee5a48f4d3@oracle.com>
Date:   Tue, 31 Mar 2020 11:16:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003310082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 adultscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003310082
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Hi,

I often run 'make foo/bar.o' as part of my workflow, even when bar.o is
not specified in any kernel makefile, and this has worked just fine for
years.

This is broken after commit 394053f4a4b3e3eeeaa67b67fc886a9a75bd9e4d
(kbuild: make single targets work more correctly) and just gives an error:

$ make kernel/test.o
   CALL    scripts/checksyscalls.sh
   CALL    scripts/atomic/check-atomics.sh
   DESCEND  objtool
make[2]: *** No rule to make target 'kernel/test.o'.  Stop.
scripts/Makefile.build:502: recipe for target '__build' failed
make[1]: *** [__build] Error 2
Makefile:1670: recipe for target 'kernel' failed
make: *** [kernel] Error 2

For top-level objects (e.g. 'make bar.o') the situation is even worse,
since make exits with status 0 without building anything :-/

Is there any chance we can get this back? It was super useful for me.


Vegard
