Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEE97154B2
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2019 21:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfEFTzF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 May 2019 15:55:05 -0400
Received: from [195.159.176.226] ([195.159.176.226]:45222 "EHLO
        blaine.gmane.org" rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbfEFTzF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 15:55:05 -0400
Received: from list by blaine.gmane.org with local (Exim 4.89)
        (envelope-from <glkd-linux-kbuild@m.gmane.org>)
        id 1hNjhW-000M0J-1M
        for linux-kbuild@vger.kernel.org; Mon, 06 May 2019 21:55:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     linux-kbuild@vger.kernel.org
From:   Robert Gadsdon <rhgadsdon@gmail.com>
Subject: Re: [PATCH] kconfig: fix 'Save As' menu of xconfig
Date:   Mon, 6 May 2019 12:10:21 -0700
Message-ID: <84db9131-5498-d2d5-a984-11079e3c2a6e@gmail.com>
References: <1552234395-7699-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
Cc:     linux-kernel@vger.kernel.org
In-Reply-To: <1552234395-7699-1-git-send-email-yamada.masahiro@socionext.com>
Content-Language: en-US
Cc:     linux-kbuild@vger.kernel.org
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 03/10/2019 09:13 AM, Masahiro Yamada wrote:
> The 'Save As' menu of xconfig is not working; it always saves the
> kernel configuration into the default file irrespective of the file
> chosen in the dialog box.
> 
> The 'Save' menu always writes into the default file, but it would
> make more sense to write into the file previously chosen by 'Load'
> or 'Save As'.
> 
> Signed-off-by: Masahiro Yamada<yamada.masahiro@socionext.com>
> ---

The 'save as' may be used for out-of-tree kernel config saves, but the 
default 'save' should always save to the in-tree .config file, as before 
(and for the past 10+ years..)  If the kernel config was loaded from an 
out-of-tree location, it now saves back to that out-of-tree location, 
which is useless for the kernel compile..

I have always kept my hardware/system-specific kernel configs 
out-of-tree, and then applied them in-tree before compiling.

Now, I have to use 'save as' and type in the entire in-tree path 
(/usr/src/linux-5.1/.config) each time, in order to apply the specific 
config to the kernel, ready for compilation.

Robert Gadsdon.
rglinuxtech.com

