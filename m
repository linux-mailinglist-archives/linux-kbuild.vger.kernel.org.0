Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09F3D216A2
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 12:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbfEQKCH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 06:02:07 -0400
Received: from esgaroth.petrovitsch.at ([78.47.184.11]:1591 "EHLO
        esgaroth.tuxoid.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728282AbfEQKCH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 06:02:07 -0400
X-Greylist: delayed 3771 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 May 2019 06:02:06 EDT
Received: from thorin.petrovitsch.priv.at (80-110-98-206.cgn.dynamic.surfer.at [80.110.98.206])
        (authenticated bits=0)
        by esgaroth.tuxoid.at (8.15.2/8.15.2) with ESMTPSA id x4H8vTgY028431
        (version=TLSv1 cipher=AES128-SHA bits=128 verify=NO);
        Fri, 17 May 2019 10:57:30 +0200
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
To:     Alexander Kapshuk <alexander.kapshuk@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20190517042753.25857-1-yamada.masahiro@socionext.com>
 <CAJ1xhMUxsFR6yLeV1rG1FRZzqwyMGF5PURk6F5_6kN3v2dGN1A@mail.gmail.com>
From:   Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Message-ID: <68270a84-966b-05e3-c82e-893c320febfd@petrovitsch.priv.at>
Date:   Fri, 17 May 2019 10:57:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJ1xhMUxsFR6yLeV1rG1FRZzqwyMGF5PURk6F5_6kN3v2dGN1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-URT-Metrics: esgaroth.tuxoid.at 1060; Body=15 Fuz1=15 Fuz2=15
X-Virus-Scanned: clamav-milter 0.97 at esgaroth.tuxoid.at
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
        autolearn=unavailable version=3.3.1
X-Spam-Report: *  0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on esgaroth.tuxoid.at
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 17/05/2019 10:16, Alexander Kapshuk wrote:
[...]
> The 'xargs' '-r' flag is a GNU extension.
> If POSIX compliance is important here, the use of 'cat', 'xargs' and
> 'basename' may be substituted with that of 'sed' to initialise
> same_name_modules:
> sed 's!.*/!!' modules.order modules.builtin | sort | uniq -d

's!' is TTBOMK also a GNU-extension:
sed 's/.*\///' modules.order modules.builtin | sort | uniq -d

> 'Sed' may also be used on its own in the 'for' loop instead of as part
> of a pipeline along with 'grep' to generate the desired output:
> sed '/\/'$m'/!d;s:^kernel/:  :' modules.order modules.builtin

sed "/\/${m}/!d;s/^kernel\//  /" modules.order modules.builtin

MfG,
	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
                     LUGA : http://www.luga.at
