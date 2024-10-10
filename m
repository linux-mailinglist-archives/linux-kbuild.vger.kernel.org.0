Return-Path: <linux-kbuild+bounces-4050-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B08BA9993E3
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 22:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A724D1C2235C
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 20:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21B21CF5F1;
	Thu, 10 Oct 2024 20:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbJIU2X+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6B11991B8;
	Thu, 10 Oct 2024 20:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728593273; cv=none; b=VKaWm4C9Ikvo5SpIebBTOW2tj3RoJUldZBMknSne9XgI92bs7J2JhPgl33a83cRCP+D4M5Ycqy3XE2UZsEmGbEi2oB6wcTES9QacYnLf7WYebtnVpvOHCFbdaGVnqJiE0RttqSLTqM/foL41jfUR94rSPQARf6jtzEKiIyG7SH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728593273; c=relaxed/simple;
	bh=aCVOEle/nrcFdPay/HXhhs2Addnk0zRr5lvJtCyqmhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L22l48WLLV7UFmT8FH0TYxiK5QGU7qSQRnLunru/G5K8lKhWiuvswKBJ4Kg7IozgaeYyEwzJnTTjpIBvotbE8VisbVwTCEAEtA/QqNnyTPa0bq0M30ok4IuIWOPp4ruLnqQchJ5TLOsqV7a8AaYXwEy140DVh3MpG+uYlrbhMIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbJIU2X+; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e330b7752cso8743137b3.1;
        Thu, 10 Oct 2024 13:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728593271; x=1729198071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJdEK/5lylYtZJKp3NRDscz1EgkpSNgnT2es2wz3zug=;
        b=nbJIU2X+KkfSx/wFyaJH9RfICNMDxOCp7MixXgLWMS5J5Cn0m2JnNt3l2pC6zv8VGa
         t85a0e2QYjOAYVcPvWy8ieBjexs3roMPqCr7ybgaHA4StwIfeon0WZyhrtSJ3xbbgcjI
         LbK63HJy9S9l02rZl5vUne+Cd/LwsCcNZD3IC3TzPwih2znxb08LQjgWpUTvXqrN4hW0
         YktK1G0ZtC0299mC2cRWfuhqYjfWcrW+ZEGxGLr9BUrUe3kF7YkSSldhMG8M3G9lNxJY
         aZrTR+pvemN1+RpVh1iPwPluqQI/0aqcKIKkaWgnyZJZvW3MX+aUcF2TzlxM4mvZJDyC
         I4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728593271; x=1729198071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJdEK/5lylYtZJKp3NRDscz1EgkpSNgnT2es2wz3zug=;
        b=Dyd4y8MkWR92OpdsKlB4Y2Jin3r8E86peO3rWGoUIx7pr3ztxNCEpKUUL06SIZsOLL
         FANlxgHZfE6n0w9Q06U3qycIxO7rFb07N8S2xxRi99u+AquxO5zFbZoi8ZosSHkGF4ZP
         2kZrsZ53UNnxurTswDdWMxWlgPy/JfMzMV1FR8z/qCsBaENp5PTds3KUGhW4Z9PrfcJm
         HhoaSm/b8JVj3ILGKh9b2A00j8F+AXPeUCNnpXrHQq9c3IdxjOOUl6tPvorG3fT6tYdk
         eJ2KN5HUv9pq0RDDA/18jIJO/s/TyywOs/NiYCDdOMicL76+Hk7EPbB+9fLYlK+IjOKN
         ZnDg==
X-Forwarded-Encrypted: i=1; AJvYcCXIqSNbpfewmHp4XWoVB7imKSE3Ha8lqu90MXFRLwpMtBV89eHf9Q6yhnmCJIcNo2Vx0FMnC3BetbPxT0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGdP6gY55OtUApkAzV6+oInZtq4ZK4aDZZwr44RLoXU9nyB/om
	I91Go5zxCSsrXtIw1x+BhgCS//pvPyZwoqAE/iTloIkKwK77i8U9
X-Google-Smtp-Source: AGHT+IEFTYM2CADzrcPW9+7HM/Ju/J731XgBQEVXow4kT6U2HeDxaBvg62z+KthZg/C8L2w2mde4dQ==
X-Received: by 2002:a05:690c:60c1:b0:6e2:451c:df02 with SMTP id 00721157ae682-6e344ccac20mr4048817b3.16.1728593271189;
        Thu, 10 Oct 2024 13:47:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:6165:1c10:b99e:4710:9fa7:9721? ([2600:1700:6165:1c10:b99e:4710:9fa7:9721])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b83ea0sm3504067b3.34.2024.10.10.13.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 13:47:50 -0700 (PDT)
Message-ID: <4a75418f-2a7e-48ca-9e05-089e57de8b49@gmail.com>
Date: Thu, 10 Oct 2024 16:47:47 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] linux-kbuild: fix: process config options set to "y"
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
 <20240913171205.22126-8-david.hunter.linux@gmail.com>
 <CAK7LNATf=1WD5a8azGZGJ73-irm8uvBZujvuW3CUncXbix+10w@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAK7LNATf=1WD5a8azGZGJ73-irm8uvBZujvuW3CUncXbix+10w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Is there any case when this condition is met?
> 
> 
On my computer, there are no cases where this condition is met. I am 
aware of config options that are numbers or are strings; however, I am 
unsure if any of them are dependencies for another config.

If you would like me to, I can make a script that can figure this out. 
Even if there are config options like this, though, I am not sure that 
skipping them would be the right thing to do. I think the best thing to 
do would be to remove this condition.

Let me know if you would like me to make a script to find out how many 
config entries are simultaneously not tristate and dependencies for 
other config entries. Also let me know if you think that I should leave 
the condition in.

My version 2 of this patch will not have the condtion in it.
Thanks,
David Hunter

