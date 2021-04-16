Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1883619BC
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 08:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238736AbhDPGJN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 02:09:13 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:36449 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238757AbhDPGJM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 02:09:12 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4FM5PT1VqSzB09Zx;
        Fri, 16 Apr 2021 08:08:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id asq1VGcTvuM5; Fri, 16 Apr 2021 08:08:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4FM5PT0ZjkzB09Zt;
        Fri, 16 Apr 2021 08:08:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id D755D8B81C;
        Fri, 16 Apr 2021 08:08:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id F2If91GvDyKN; Fri, 16 Apr 2021 08:08:45 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 930AF8B81A;
        Fri, 16 Apr 2021 08:08:44 +0200 (CEST)
Subject: Re: [PATCH] symbol : Make the size of the compile-related array fixed
To:     =?UTF-8?B?6Z+p5aSn6bmPKEhhbiBEYXBlbmcp?= <handapeng@oppo.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "x86@kernel.org" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Mike Rapoport <rppt@kernel.org>,
        Pekka Enberg <penberg@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arseny Solokha <asolokha@kb.kras.ru>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Kees Cook <keescook@chromium.org>,
        Joerg Roedel <jroedel@suse.de>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Cc:     =?UTF-8?B?6ZmI5a6J5bqGKEFucWluZyk=?= <chenanqing@oppo.com>
References: <TY2PR02MB3709103991CF81E89C8F1E37CB4C9@TY2PR02MB3709.apcprd02.prod.outlook.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <db764cb6-4294-10c0-56ed-a0fe3b307018@csgroup.eu>
Date:   Fri, 16 Apr 2021 08:08:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <TY2PR02MB3709103991CF81E89C8F1E37CB4C9@TY2PR02MB3709.apcprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

This mail is unreadable.

Please send your patch as raw text mail, not as attached file.

Thanks
Christophe

Le 16/04/2021 à 05:12, 韩大鹏(Han Dapeng) a écrit :
> ----------------------------------------------------------------------------------------------------
> *OPPO*
> *
> *
> 本电子邮件及其附件含有OPPO公司的保密信息，仅限于邮件指明的收件人使用（包含个人及群组）。禁止任何人在 
> 未经授权的情况下以任何形式使用。如果您错收了本邮件，请立即以电子邮件通知发件人并删除本邮件及其附件。
> 
> This e-mail and its attachments contain confidential information from OPPO, which is intended only 
> for the person or entity whose address is listed above. Any use of the information contained herein 
> in any way (including, but not limited to, total or partial disclosure, reproduction, or 
> dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this 
> e-mail in error, please notify the sender by phone or email immediately and delete it!
> 
