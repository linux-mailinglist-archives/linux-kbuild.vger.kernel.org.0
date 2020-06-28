Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3BE20C711
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 10:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgF1IkT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 04:40:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27788 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726069AbgF1IkR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 04:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593333616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=af6hwOQYKK7YYhgNFcZ9tSLl6pfi2IMJiB6kIue1Nrk=;
        b=Uy55iITboHcOmhpPpcV0sWbiOXeymH8VijP5SJWds9QFoIyZOmrklZhFfp5kNOFLN6Kfqo
        Il0qXUt/Yz8kzt4gfjO59BV/iKO0J/eAzDyt4XlLbhjOxaKJ2qyADyNvm6EMdgWFBsL2Ry
        YiiCaCKlEZcP074Ya+1qDcN4r0Bb/JU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-p4N_Aia0OQiodrK7X0ridg-1; Sun, 28 Jun 2020 04:40:14 -0400
X-MC-Unique: p4N_Aia0OQiodrK7X0ridg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E69681005513;
        Sun, 28 Jun 2020 08:40:12 +0000 (UTC)
Received: from starship (unknown [10.35.206.208])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AC2B696B8F;
        Sun, 28 Jun 2020 08:40:11 +0000 (UTC)
Message-ID: <c3c58115168c983eb1d441daa7cc84378cf33f39.camel@redhat.com>
Subject: Re: [PATCH] kconfig: qconf: Fix find on split mode
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sun, 28 Jun 2020 11:40:10 +0300
In-Reply-To: <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593096720.git.mchehab+huawei@kernel.org>
References: <20200625154226.25692cd1@coco.lan>
         <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593096720.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 2020-06-25 at 16:52 +0200, Mauro Carvalho Chehab wrote:
> The logic handling find on split mode is currently broken.
> Fix it, making it work again as expected.

I tested this patch and it works well.
There is one really small cosmetic issue:

If you select search result, and then select another search result
which happens not to update the 'menu', then both the results are
selected (that is the old one doesn't clear its selection)

Best regards,
	Maxim Levitsky

> 
> Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/kconfig/qconf.cc | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index c0ac8f7b5f1a..b8f577c6e8aa 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1645,22 +1645,21 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
>  			return;
>  		list->setRootMenu(parent);
>  		break;
> -	case symbolMode:
> +	case menuMode:
>  		if (menu->flags & MENU_ROOT) {
> -			configList->setRootMenu(menu);
> +			menuList->setRootMenu(menu);
>  			configList->clearSelection();
> -			list = menuList;
> -		} else {
>  			list = configList;
> +		} else {
> +			configList->setRootMenu(menu);
> +			configList->clearSelection();
> +
>  			parent = menu_get_parent_menu(menu->parent);
>  			if (!parent)
>  				return;
> -			item = menuList->findConfigItem(parent);
> -			if (item) {
> -				item->setSelected(true);
> -				menuList->scrollToItem(item);
> -			}
> -			list->setRootMenu(parent);
> +			menuList->setRootMenu(parent);
> +
> +			list = menuList;
>  		}
>  		break;
>  	case fullMode:


