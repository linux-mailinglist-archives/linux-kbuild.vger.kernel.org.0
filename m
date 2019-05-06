Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7391542D
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2019 21:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfEFTK0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 May 2019 15:10:26 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35693 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfEFTK0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 15:10:26 -0400
Received: by mail-pg1-f196.google.com with SMTP id h1so6938533pgs.2;
        Mon, 06 May 2019 12:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:newsgroups:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9jO/ahJRB+Px44zguVkj7zF4Hq0FcXKIPGMM17YjuPg=;
        b=C7qO46Owo391rrCME2jNC8g202rdRFT0mvYDxy9h1EQafI8c2JNiNDT+Mp9YROuiQw
         GcQG3moSn6h95IP/WCrpr+jwnGl8wV4T89K3xOLqrIrBBy820VZMzl9A9y3DG3FAcnsF
         qd6juKyk+tg45aF1alrbup5S+gQUoan7/Ueu8y7IYdzmN9X/COpQz1zqoXagnz4z6J6D
         6zXUzy51SqDY4QVY0dOc2eyi+U5Y1GobwGdoZIBSbcJsoYkhP84Eeg3iwRIK5j9LblU2
         If7bAfDOm5ijlDpfpqLXHYx7c4PtWyYTbXs08qQ3IC+djYfosFGtT0Q2KuwFnPqHbg9z
         hokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:newsgroups:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9jO/ahJRB+Px44zguVkj7zF4Hq0FcXKIPGMM17YjuPg=;
        b=LRr+tQbm8ytLiZkmtxJYg4VBTtdJr23iZjmNQMXHcL8NBIeRX3XhH5K5wFupofmplE
         d+C8z7tJlbM+qA4m0wwXAw7/iapWWKVtrM16NpG40NIF/BiuW+UPcxnJZqdif0EJ0w25
         q/LMEvkUvpyXpF7XssoaiJ6YuiCBOZIwxG7qRXmGfegYeQWO8DJKbbg6qm8CTjtob4jE
         ahv6AqkR/hEaXkUjtVdESX8dWinRMW1aHgrd7gxoLspJXrpiCJEIw6QOpTlUaKtQGNv0
         ytXJZ+GgjA0HS4+GqPYqmVMp8EThUI1WoaTWsrvZoHRRjr8iqWGw6OS1qErWWx/AIhg7
         S5jw==
X-Gm-Message-State: APjAAAUWDJnQKp+EJnwAbTMFP2iU/6frflMAMOrLz78+CaTIF2sPu1TY
        OJjz8CMa+0hMtTmTUcBBiKBno2tP
X-Google-Smtp-Source: APXvYqxnZIbX947YWBxnv6hz4gECy//DYiwPTncI39gyYqZCb0cncitKEKaeREoGUlR+gW74VDrH8Q==
X-Received: by 2002:a63:a41:: with SMTP id z1mr33991488pgk.389.1557169825178;
        Mon, 06 May 2019 12:10:25 -0700 (PDT)
Received: from [192.168.0.2] ([98.248.174.105])
        by smtp.googlemail.com with ESMTPSA id p7sm13445161pgn.64.2019.05.06.12.10.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 12:10:24 -0700 (PDT)
Subject: Re: [PATCH] kconfig: fix 'Save As' menu of xconfig
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        linux-kernel@vger.kernel.org
Newsgroups: gmane.linux.kernel,gmane.linux.kbuild.devel
References: <1552234395-7699-1-git-send-email-yamada.masahiro@socionext.com>
From:   Robert Gadsdon <rhgadsdon@gmail.com>
Message-ID: <84db9131-5498-d2d5-a984-11079e3c2a6e@gmail.com>
Date:   Mon, 6 May 2019 12:10:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1552234395-7699-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
